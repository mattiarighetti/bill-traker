ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Wednesday 19 February 2015
} {
    spesa_id:integer
}
with_catch errmsg {
    set data [db_string query "select data from mmr_spese where spesa_id = :spesa_id"]
    db_dml query "DELETE FROM mmr_spese WHERE spesa_id = :spesa_id"
    set subject "Bollettino Errata Corrige"
    set body "<p>La veneranda Magione informa che la spesa #$spesa_id del $data è stata cassata.<br><br>Cordialmente,<br><b>La direzione.</b></p>"
    db_foreach query "select distinct(p.email) from parties p inner join mmr_spese s on s.user_id = p.party_id" {
	acs_mail_lite::send -send_immediately -to_addr $email -from_addr "notifications-from-the-magione@app.mattiarighetti.it" -subject $subject -reply_to "mattia@mattiarighetti.it" -body $body -mime_type "text/html"
    }
} {
    ad_return_complaint 1 "<b>Attenzione: non è stato possibile cancellare la categoria evento.</b><br>L'errore riportato dal database è:<br><br><code>$errmsg</code>"
    return
}
ad_returnredirect "index"
ad_script_abort
