<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
     {include file="optional_styling_css.tpl"/}     
  </head>

  <body>
     {include file="navbar.tpl"/}  

    <div class="container" itemscope itemtype="{$host/}/profile/esa_api.xml">
        <div class="main">
          <form class="form-horizontal well" id="reminder" method='POST' action='{$host/}/reminder' itemprop="create">
            <fieldset>

             <legend>Username/ Password Reminder</legend>
              <p>If you've forgotten your Username or Password, simply fill in your e-mail address below, then answer your security question. We will assign you a new random password and remind you of your Username via email. Once you log back in you may choose your own password by editing your member profile. </p>

              <div class="control-group">
                <label class="control-label" itemprop="email">Email</label>
                <div class="controls">
                  <input type="email" class="input-xlarge" id="email" name="email" rel="popover" data-content="Enter your email" data-original-title="Email" placeholder="email@example.com" value="{$form.email/}" required>
                </div>
              </div>  
            
              <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
                  <button type="submit" class="btn btn-info" >Check e-mail</button>
                  <input type="reset" class="btn btn-default" value="Reset">
                </div>
              </div>

              {if isset="$error"}
                  <div class="control-group">
                    <label class="control-label">Error</label>
                      {$error/}
                  </div>
              {/if}     
              
          </fieldset>
          </form>
        </div>
      </div>
    <!-- Placed at the end of the document so the pages load faster -->
    {include file="optional_enhancement_js.tpl"/}     
  </body>
</html>