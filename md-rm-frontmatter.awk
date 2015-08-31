BEGIN {drop=0}
/^---/{if(NR==1) {drop=1} else {drop=2}}
drop>0{$0="YAML"}
drop==2{drop=0}
{print}
