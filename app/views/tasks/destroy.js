$("#<%= dom_id(@task) %>").remove();
$("#<%= dom_id @list %>").replaceWith("<%= escape_javascript(render :partial => "/lists/detail", :locals => { :list => @list }) %>")
