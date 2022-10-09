#!/bin/bash
arbol(){
if [ $1 -eq 1 ];then
md='+'; mf='-'
else
md="  "; mf="  "
fi
for i in $2/*;do 
nivel=`echo  $i  | tr  -s  '/'  '  '  | wc  -w` 
if [ -f $i ];then
for j  in `seq  1  $nivel`;do
echo -n " "
done
echo $mf`basename  $i` 
cf=$(($cf+1))
elif [ -d $i ];then
for j  in `seq  1  $nivel`;do 
echo -n " "
done
echo $md`basename  $i` cd=$(($cd+1))
arbol  $marca  $i 
fi 
done
}

marca=0  
cf=0;cd=0
if [ $# -eq 1 -o $# -eq 2 ];then 
for i in $*;do
if [ "$i" == "-f" ];then
marca=1
shift
elif [ -d $i ];then
if [ $marca  -eq  1  ];then 
echo '+'$i
else
echo $i
fi
arbol  $marca  $i
echo "Se han encontrado: $cf ficheros"
echo "Se han encontrado: $cd directorios"
else
echo "$i no válido"
fi 
done
else
echo "Debe  introducir  un  o  dos  parámetros"
fi

