BEGIN {
    line = 0 ;
    print("Iteration" "," "Timestamp" "," "DateTime" "," "SystemMode" "," "TxPower" "," "CellID(HEX)" "," "RSSIMain[dbm]" "," "RSSIDiversity[dbm]" "," "RSRPmain[dbm]" "," "RSRPdiversity[dbm]" "," "RSRQ[db]" "," "SNR[db]" "," "ModemDump" "," "PSstate" "," "band"); 
}
{
	if ( $0 ~ /Timestamp:/ ) {
	    if( line > 0 ) {
	      print( line "," ts "," dt "," sm "," pw "," cell "," rxm "," rxd "," rsrpm "," rsrpd "," rsrq "," snr "," dump "," psstate "," band) ;
	    }
	    line++ ;
		ts = substr($2,1,10) ;
	}
	
	if ( $0 ~ /System mode:/ ) {
		sm = $3 ;
	}

	if ( $0 ~ /Timestamp:/ ) {
		dt = $3 FS $4 ;
	}

	if ( $0 ~ /Tx Power:/ ) {
	    pw = $3 ;
	}
	
	if ( $0 ~ /Cell ID:/ ) {
	    cell = $6 ;
	}

	if ( $0 ~ /RxM RSSI/ ){
        rxm = $4;
    }
    
    if ( $0 ~ /RxD RSSI/ ){
        rxd = $4;
    }
    
    if ( $0 ~ /RxM RSSI/ ){
        rsrpm = $7;
    }
    
    if ( $0 ~ /RxD RSSI/ ){
        rsrpd = $7;
    }
    
    if ( $0 ~ /Cell ID:/ ){
        rsrq = $3;
    }
    
    if ( $0 ~ /SINR/ ){
        snr = $3;
    }
    
    if ( $0 ~/No crash/ ){
        dump = $0;
    }
    
    if ( $0 ~/PS state:/ ){
        psstate = $6;
    }
    
    if ( $0 ~/LTE band:/ ){
        band = $3;
    }
    
}