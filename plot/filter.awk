#!/usr/bin/awk -f

function avg(array,     sum) {
	for (i in array) {
		sum += array[i];
	}
	return sum / length(array);
}

BEGIN {
	FS = ", ";
	OFS = ",";
	len = 9;
}

{
	values[NR] = $8;
	delete values[NR - len];

	if (NR > len / 2)
		print avg(values), $3;
}
