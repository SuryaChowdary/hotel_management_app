$("#location").html("<%= j options_from_collection_for_select(@locations, :id, :country) %>");
