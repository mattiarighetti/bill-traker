ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Tuesday 21 April 2015
} {
    {orderby "data,desc"}
}
template::head::add_css -href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
template::head::add_css -href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
template::head::add_javascript -src "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
set page_title "Contabilità della magione"
set context [list $page_title]
set actions "{Nuova spesa} {spesa-gest} {Aggiunge una nuova spesa}"
if {![ad_conn user_id]} {
    ad_returnredirect "http://app.mattiarighetti.it/register/?return%5furl=[ad_return_url]"
}
if {[db_0or1row query "select * from mmr_utenti where user_id = [ad_conn user_id]"} {
} else {
    ad_return_complaint 1 "Utente non collegato ad alcuna magione."
}
    #totali e spese per utente mangione
template::list::create \
    -name spese \
    -multirow spese \
    -actions $actions \
    -elements {	
	spesa_id {
	    label "ID"
	}
	tipologia {
	    label "Tipologia"
	}
	data {
	    label "Data"
	}
	user {
	    label "Account"
	}
	totale {
	    label "Ammontare"
	}
	edit {
	    link_url_col edit_url
	    display_template {<img src="/shared/images/Edit16.gif" height="12" border="0">}
	    link_html {title "Modifica spesa" onClick "return(confirm('Confermi di voler modificare la spesa? Il coinquilino ne sarà notificato.'));"}
	    sub_class narrow
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="/shared/images/Delete16.gif" height="12" border="0">}
	    link_html {title "Cancella spesa" onClick "return(confirm('Confermi di voler cancellare la spesa? Il coinquilino ne sarà notificato. '));"}
	    sub_class narrow
	}
    } \
    -orderby {
	default_value data
	data {
	    label "ID"
	    orderby data 
	}
    }
db_multirow \
    -extend {
	edit_url
	delete_url
    } spese query "SELECT s.spesa_id, t.descrizione as tipologia, s.data, case when s.user_id = 675 then 'Mattia' when s.user_id = 684 then 'Andrea' end as user, s.totale, s.descrizione FROM mmr_spese s, mmr_tipologie t where t.tipo_id = s.tipo_id [template::list::orderby_clause -name spese -orderby]" {
	set edit_url [export_vars -base "spesa-gest" {spesa_id}]
	set delete_url [export_vars -base "spesa-canc" {spesa_id}]
    }
