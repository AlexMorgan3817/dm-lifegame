/turf
	icon = 'icons/turf.dmi'
	color = "#242424"

/turf/simulator/New()
	if(!locate(/obj/lifecell) in src)
		new /obj/lifecell(src)


