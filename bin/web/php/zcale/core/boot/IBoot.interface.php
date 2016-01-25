<?php

interface zcale_core_boot_IBoot extends zcale_core_events_interfaces_IAsyncDispatcher, zcale_core_boot_ITracer{
	//;
	//;
	//;
	function boot($mainClass);
}
