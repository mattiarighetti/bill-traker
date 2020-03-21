ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Tuesday 21 April 2015
} {
    spesa_id:integer,optional
}
if {[ad_conn user_id] > 822} {
    if {[ad_conn user_id]} {
	ad_returnredirect -message "Utente non abilitato" "http://app.mattiarighetti.it/"
    } else {
	ad_returnredirect "http://app.mattiarighetti.it/register/?return%5furl=[ad_return_url]"
    }
}
template::head::add_css -href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
template::head::add_css -href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
template::head::add_javascript -src "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
set focus "spesa.totale"
if {[ad_form_new_p -key spesa_id]} {
    set page_title "Nuova spesa"
    set subject "Ottime notizie dalla Magione: nuova spesa."
    set body "Ave.<br><br>Benedetto sia il cibo, l'elettricità e il consumismo.<br>Poveri son i nostri porta pecunie.<br><br>"
    set buttons [list [list "Aggiungi spesa" new]]
} else {
    set page_title "Modifica spesa"
    set subject "La contabilità della Magione ha subito modifiche."
    set descrizione_b [db_string query "select descrizione from mmr_spese where spesa_id = :spesa_id"]
    set data_b [db_string query "select data from mmr_spese where spesa_id = :spesa_id"]
    set totale_b [db_string query "select totale from mmr_spese where spesa_id = :spesa_id"]
    set tipologia_b [db_string query "select t.descrizione from mmr_tipologie t, mmr_spese s where t.tipo_id = s.tipo_id and s.spesa_id = :spesa_id"]
    set body "Ave.<br><br>La presente per informarLa che la <u>spesa $spesa_id</u> è stata deliberatamente modificata <b>da</b><br><br><ul><li>Descrizione: <i>$descrizione_b</i></li><li>Data: <i>$data_b</i></li><li>Totale: <i>$totale_b</i></li><li>Tipologia: <i>$tipologia_b</i></li></ul><br><b>in</b><br>"
    set buttons [list [list "Modifica spesa" edit]]
}
set current_date [db_string query "select to_char(current_date, 'YYYY MM DD')"]
ad_form -name spesa \
    -edit_buttons $buttons \
    -has_edit 1 \
    -form {
	spesa_id:key
	{data:date,to_sql(linear_date_no_time),to_html(sql_date)
	    {label "Data"}
	    {format "DD MONTH YYYY"}
	    {value $current_date}
	}
	{totale:text
	    {label "Totale"}
	}
	{tipo_id:integer(select)
	    {label "Tipologia"}
	    {options {[db_list_of_lists query "select descrizione, tipo_id from mmr_tipologie order by tipo_id"]} }
	}
	{descrizione:text,optional
	    {label "Descrizione"}
	    {html {size 70 maxlength 100}}
	}
    }  -select_query {
	"SELECT spesa_id, descrizione, data, tipo_id, totale FROM mmr_spese WHERE spesa_id = :spesa_id"
    } -new_data {
      	set spesa_id [db_string query "SELECT COALESCE(MAX(spesa_id)+1,1) FROM mmr_spese"]
	db_dml query "INSERT INTO mmr_spese (spesa_id, descrizione, data, user_id, tipo_id, totale) VALUES (:spesa_id, :descrizione, :data, [ad_conn user_id], :tipo_id, :totale)"
    } -edit_data {
	db_dml query "UPDATE mmr_spese SET descrizione = :descrizione, data = :data, tipo_id = :tipo_id, totale = :totale WHERE spesa_id = :spesa_id"
    } -on_submit {
	set totale [string map {, .} $totale]
    } -after_submit {
	set tipologia [db_string query "select descrizione from mmr_tipologie where tipo_id = :tipo_id"]
	if {$page_title eq "Nuova spesa"} {
	    append body "La spesa <i>$spesa_id</i> è stata aggiunta:<br><br><ul><li>Descrizione: <i>$descrizione</i></li><li>Data: <i>$data</i></li><li>Totale: <i>$totale</i></li><li>Tipologia: $tipologia</li></ul><br><br>Tanto Le dovevamo per opportuna canoscenza.<br><br>In fede,<br><i><b>La direzione della Magione</b></i>"
	} else {
	    append body "<ul><li>Descrizione: <i>$descrizione</i></li><li>Data: <i>$data</i></li><li>Totale: <i>$totale</i></li><li>Tipologia: $tipologia</li></ul><br><br>Tanto Le dovevamo per opportuna canoscenza.<br><br>In fede,<br><i><b>La direzione della Magione</b></i>"
	}
	db_foreach query "select email from parties where party_id = 675 or party_id = 684" {
	    acs_mail_lite::send -send_immediately -to_addr $email -from_addr "notifications-from-the-magione@app.mattiarighetti.it" -subject $subject -reply_to "mattia@mattiarighetti.it" -body $body -mime_type "text/html"
	}
	ad_returnredirect -message "Spesa correttamente registrata (ID: $spesa_id)." index
	ad_script_abort
    }
