-- Duplication (conceptual) and actual duplication (code duplication is handled here).
-- Each line of the ORIGIN_TABLE is processes separately.
-- Each line correponds to a routine id, in other words, each line represents one
-- routine (the notion of routine corresponds to a feature introduced intp a class
-- without ant predecessors, and all its evolutions throughout the various inheritance
-- adaptations and branches).
--
-- Before repeated inheritance was implemented, the routine `compute_feature_table'
-- performed the following operations:
--		1) For each line pick one FEATURE_I that would be the selected one.
--		1.a) If the FEATURE_I's all have the same body id, the first feature is chosen
--			arbritrarily
--		1.b) Otherwise, go through the parent clauses and find the selection. If several
--			selections ---> VMRC2, otherwise insert the selected name into the global
--			"Selected" string list. Unselect the other FEATURE_I's, i.e. compute a new routine
--			id set for them (one element) and insert them as new routines into the SELECT_TABLE
--		1.c) If nothing found ---> VMRC3
-- Modifications for correct implementation of the semantics of repeated inheritance:
--

class ORIGIN_TABLE 

inherit

	EXTEND_TABLE [SELECTION_LIST, INTEGER];
	SHARED_WORKBENCH
		export
			{NONE} all
		undefine
			twin
		end;
	SHARED_ERROR_HANDLER
		export
			{NONE} all
		undefine
			twin
		end;


creation

	make
	
feature 

	insert (info: INHERIT_INFO) is
			-- Insert information `info' in the table.
		require
			good_argument: info /= Void;
			good_context: not (	info.a_feature = Void
								or else
								info.a_feature.rout_id_set = Void);
		local
			rout_id_set: ROUT_ID_SET;
			i, nb, rout_id: INTEGER;
			l: SELECTION_LIST;
		do
			from
				rout_id_set := info.a_feature.rout_id_set;
				nb := rout_id_set.count;
				i := 1;
			until
				i > nb
			loop
				rout_id := rout_id_set.item (i);
				if rout_id < 0 then
					rout_id := - rout_id;
				end;
				l := item (rout_id);
				if l = Void then
					!!l.make;
					put (l, rout_id);
				end;
				l.add (info);

				i := i + 1;
			end;
		end;

	delete (info: INHERIT_INFO) is
			-- Insert information `info' in the table.
		require
			good_argument: info /= Void;
			good_context: not	(	info.a_feature = Void
									or else
									info.a_feature.rout_id_set = Void);
		local
			rout_id_set: ROUT_ID_SET;
			i, nb, rout_id: INTEGER;
			l: SELECTION_LIST;
		do
			from
				rout_id_set := info.a_feature.rout_id_set;
				nb := rout_id_set.count;
				i := 1;
			until
				i > nb
			loop
				rout_id := rout_id_set.item (i);
				if rout_id < 0 then
					rout_id := - rout_id;
				end;
				l := item (rout_id);
				l.start;
				l.search_same (info);
				check
					not l.after
				end;
				l.remove;

				i := i + 1;
			end;
		end;
				
	compute_feature_table (parents: PARENT_LIST; old_t, new_t: FEATURE_TABLE) is
			-- Origin table for instance of FEATURE_TABLE resulting
			-- of an analysis of possible repeated inheritance
		local
			rout_id: INTEGER;
			selected: FEATURE_I;
			vmrc3: VMRC3;
		do
	--io.error.putstring ("========= START TRACE, class ");
	--io.error.putstring (new_t.associated_class.class_name);
	--io.error.putstring (" ============%N");
			from
				!!computed.make (count);
				start;
			until
				after
			loop
				rout_id := key_for_iteration;
				selected := item_for_iteration.selection
												(parents, old_t, new_t);
				if selected = Void then
						-- No selected feature
					!!vmrc3;
					vmrc3.set_class (System.current_class);
					vmrc3.set_selection_list (item_for_iteration);
					Error_handler.insert_error (vmrc3);
				else
					computed.put (selected, key_for_iteration);
					if selected.is_replicated then
						new_t.replace (selected, selected.feature_name);
					end
				end;
				forth;
			end;
--io.error.putstring ("========= END TRACE ==========%N");
		end;

	computed: SELECT_TABLE;
				-- Feature table computed by `compute_feature_table'.
		
-- Selection: if all the parents in the informations are all the same, then
-- a selection is not needed if either all the body id's are the same or
-- one of them is selected. If there are differrent parent, a selection is
-- not needed if all the body ids are the same.

end
