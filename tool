#! /bin/bash
# FMD Apktool v0.5 Stable
# Developer by shepik997
# FMD Team 
e="\x1b[";c=$e"39;49;00m";y=$e"93;01m";cy=$e"96;01m";r=$e"1;91m";g=$e"92;01m";m=$e"95;01m";
PATH=${PATH}:~/work/FMDApktool/scripts 
export PATH
PATH="$PATH:$PWD/scripts"
export PATH
bin="$PWD/.bin";
chmod -R 755 "$bin";
chmod -R 755 scripts;
chmod -R 755 resources;
cd "$PWD";
################### APKTool ###################
sys ()
{
clear   
cd resources
grep_apk1="$(find . -maxdepth 1 -type f | grep -i \\.apk$ | sed 's/ /ftemps/g' 2>/dev/null)";
grep_apk="$(echo $grep_apk1 | sed -e 's/\.\///g' | sort -f)";
cd ..
if [ "$grep_apk" == "" ];
then
  printf %s "Отсутствуют какие-либо apk в папке resources! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "0" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; sys;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *           $cyУстановка опорных ресурсов$c              *
  *****************************************************
  *     $yВыберите apk$c      *      0 - Вернуться        *
  *****************************************************";                       
for filename in $grep_apk 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read apkd;
if [ "$apkd" == "0" ];
    then
      apktool;
fi;
if [ "$apkd" == "" ];
    then
      apkd=1;
fi;
if [ "$(echo $apkd | sed 's/[0-9]*//')" == "" ] || [ "apkd"=="1" ];
	then
	  file_chosen=${file_array[$apkd]};
	  if [ "$file_chosen" == "" ];
      then
        sys;
      else
        cd scripts;
        clear;
        cp -f ../resources/"$file_chosen" > /dev/null 2>&1;
        java -jar apktool.jar if  ../resources/"$file_chosen";
        cd ..;
      fi;
	else
	  sys;
fi;
pause;
apktool;
}
de_apk ()
{
clear;    
cd resources
grep_apk1="$(find . -maxdepth 1 -type f | grep -i \\.apk$ | sed 's/ /ftemps/g' 2>/dev/null)";
grep_apk="$(echo $grep_apk1 | sed -e 's/\.\///g' | sort -f)";
cd ..
if [ "$grep_apk" == "" ];
then
  printf %s "Отсутствуют какие-либо apk в папке resources! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "0" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; de_apk;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *                $cyДекомпиляция APK$c                   *
  *****************************************************
  *     $yВыберите apk$c      *      0 - Вернуться        *
  *****************************************************";                       
for filename in $grep_apk 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read apkd;
if [ "$apkd" == "0" ];
    then
      apktool;
fi;
if [ "$apkd" == "" ];
    then
      apkd=1;
fi;
if [ "$(echo $apkd | sed 's/[0-9]*//')" == "" ] || [ "apkd"=="1" ];
	then
	  file_chosen=${file_array[$apkd]};
	  if [ "$file_chosen" == "" ];
      then
        de_apk;
      else
        cd decompile;
        clear;
        cp -f ../resources/"$file_chosen" > /dev/null 2>&1;
        java -jar ../scripts/apktool.jar d  ../resources/"$file_chosen";
        cd ..;
      fi;
	else
	  de_apk;
fi;
pause;
apktool;
}
de_jar ()
{
clear;    
cd resources
grep_jar1="$(find . -maxdepth 1 -type f | grep -i \\.jar$ | sed 's/ /ftemps/g' 2>/dev/null)";
grep_jar="$(echo $grep_jar1 | sed -e 's/\.\///g' | sort -f)";
cd ..
if [ "$grep_jar" == "" ];
then
  printf %s "Отсутствуют какие-либо apk в папке resources! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "0" ]]; 
	then 
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; de_jar;
  fi;
fi
count=0;
echo -e "
  *****************************************************
  *                $cyДекомпиляция JAR$c                   *
  *****************************************************
  *     $yВыберите jar$c      *      0 - Вернуться        *
  *****************************************************";                       
for filename in $grep_jar 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read jard;
if [ "$jard" == "0" ];
    then
      apktool;
fi;
if [ "$jard" == "" ];
    then
      jard=1;
fi;
if [ "$(echo $jard | sed 's/[0-9]*//')" == "" ] || [ "jard"=="1" ];
	then
	  file_chosen=${file_array[$jard]};
	  if [ "$file_chosen" == "" ];
      then
        de_jar;
      else
        cd decompile;
        clear;
        cp -f ../resources/"$file_chosen" > /dev/null 2>&1;
        java -jar ../scripts/apktool.jar d  ../resources/"$file_chosen";
        cd ..;
      fi;
	else
	  de_jar;
fi;
pause;
apktool;
}
co_apk_sign ()
{
clear;    
cd decompile;
folder_apk="$(echo  * )";
if [ "$folder_apk" == "" ];
then
  printf %s "Отсутствуют какие-либо папки в decompile! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "0" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; co_apk_sign;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *                  $cyКомпиляция APK$c                   *
  *****************************************************
  *     $yВыберите папку$c      *      0 - Вернуться      *
  *****************************************************";                       
for filename in $folder_apk 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read apkd;
if [ "$apkd" == "0" ];
    then
      apktool;
fi;
if [ "$apkd" == "" ];
    then
      apkd=1;
fi;
if [ "$(echo $apkd | sed 's/[0-9]*//')" == "" ] || [ "apkd"=="1" ];
	then
	  file_chosen=${file_array[$apkd]};
	  if [ "$file_chosen" == "" ];
      then
        co_apk_sign;
      else
       cd decompile
       clear
       cp -f ../decompile/$file_chosen > /dev/null 2>&1;
       java -jar ../scripts/apktool.jar b ../decompile/$file_chosen/;
       cp -f ../decompile/$file_chosen/dist/*.apk > /dev/null 2>&1;
       java -jar ../scripts/signapk.jar -w ../scripts/testkey.x509.pem ../scripts/testkey.pk8 ../decompile/$file_chosen/dist/*.apk ../output/new_apk_signed.apk;
       cd ..
      fi;
	else
	  co_apk_sign;
fi;
pause;
apktool;
}
co_apk_nosign ()  
{
clear;    
cd decompile;
folder_apk="$(echo  * )";
if [ "$folder_apk" == "" ];
then
  printf %s "Отсутствуют какие-либо папки в decompile! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "0" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; co_apk_nosign;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *                  $cyКомпиляция APK$c                   *
  *****************************************************
  *     $yВыберите папку$c      *      0 - Вернуться      *
  *****************************************************";                       
for filename in $folder_apk 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read apkc;
if [ "$apkc" == "0" ];
    then
      apktool;
fi;
if [ "$apkc" == "" ];
    then
      apkc=1;
fi;
if [ "$(echo $apkc | sed 's/[0-9]*//')" == "" ] || [ "apkc"=="1" ];
	then
	  file_chosen=${file_array[$apkc]};
	  if [ "$file_chosen" == "" ];
      then
        co_apk_nosign;
      else
       cd decompile
       clear
       cp -f ../decompile/"$file_chosen" > /dev/null 2>&1;
       java -jar ../scripts/apktool.jar b ../decompile/"$file_chosen"/;
       cd ..
      fi;
	else
	  co_apk_nosign;
fi;
pause;
apktool;
}
co_jar_nosign ()  
{
clear;    
cd decompile;
folder_jar="$(echo  * )";
if [ "$folder_jar" == "" ];
then
  printf %s "Отсутствуют какие-либо папки в decompile! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "1" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; co_jar_nosign;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *                  $cyКомпиляция JAR$c                   *
  *****************************************************
  *     $yВыберите папку$c      *      0 - Вернуться      *
  *****************************************************";                       
for filename in $folder_jar 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read jarc;
if [ "$jarc" == "0" ];
    then
      apktool;
fi;
if [ "$jarc" == "" ];
    then
      jarc=1;
fi;
if [ "$(echo $jarc | sed 's/[0-9]*//')" == "" ] || [ "jarc"=="1" ];
	then
	  file_chosen=${file_array[$jarc]};
	  if [ "$file_chosen" == "" ];
      then
        co_jar_nosign;
      else
       cd decompile
       clear
       cp -f ../decompile/"$file_chosen" > /dev/null 2>&1;
       java -jar ../scripts/apktool.jar b ../decompile/"$file_chosen"/;
       cd ..
      fi;
	else
	  co_jar_nosign;
fi;
pause;
apktool;
}
co_jar_sign ()
{
clear;    
cd decompile
folder_jar="$(echo  "*" )";
if [ "$folder_jar" == "" ];
then
  printf %s "Отсутствуют какие-либо папки в decompile! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "1" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; co_jar_sign;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *                  $cyКомпиляция JAR$c                   *
  *****************************************************
  *     $yВыберите папку$c      *      0 - Вернуться      *
  *****************************************************";                       
for filename in $folder_jar 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read jarc;
if [ "$jarc" == "0" ];
    then
      apktool;
fi;
if [ "$jarc" == "" ];
    then
      jarc=1;
fi;
if [ "$(echo $jarc | sed 's/[0-9]*//')" == "" ] || [ "jarc"=="1" ];
	then
	  file_chosen=${file_array[$jarc]};
	  if [ "$file_chosen" == "" ];
      then
        co_jar_sign;
      else
       cd decompile
       clear
       cp -f ../decompile/$file_chosen > /dev/null 2>&1;
       java -jar ../scripts/apktool.jar b ../decompile/$file_chosen/;
       cp -f ../decompile/$file_chosen/dist/*.jar > /dev/null 2>&1;
       java -jar ../scripts/signapk.jar -w ../scripts/testkey.x509.pem ../scripts/testkey.pk8 ../decompile/$file_chosen/dist/*.jar ../output/new_jar_signed.jar;
       cd ..
      fi;
	else
	  co_jar_sign;
fi;
pause;
apktool;
}
signing_apk ()
{
clear;    
cd signing
grep_apk1="$(find . -maxdepth 1 -type f | grep -i \\.apk$ | sed 's/ /ftemps/g' 2>/dev/null)";
grep_apk="$(echo $grep_apk1 | sed -e 's/\.\///g' | sort -f)";
cd ..
if [ "$grep_apk" == "" ];
then
  printf %s "Отсутствуют какие-либо apk в папке signing! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "0" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; signing_apk;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *                    $cyПодпись APK$c                    *
  *****************************************************
  *     $yВыберите apk$c      *      0 - Вернуться        *
  *****************************************************";                       
for filename in $grep_apk 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read apks;
if [ "$apks" == "0" ];
    then
      apktool;
fi;
if [ "$apks" == "" ];
    then
      apks=1;
fi;
if [ "$(echo $apks | sed 's/[0-9]*//')" == "" ] || [ "apks"=="1" ];
	then
	  file_chosen=${file_array[$apks]};
	  if [ "$file_chosen" == "" ];
      then
        signing_apk;
      else
        cd signing;
        clear;
        cp -f "$file_chosen" > /dev/null 2>&1;
	java -jar ../scripts/signapk.jar -w ../scripts/testkey.x509.pem ../scripts/testkey.pk8 "$file_chosen" ../output/new_apk_signed.apk;
        cd ..;
      fi;
	else
	  signing_apk;
fi;
pause;
apktool;
}
signing_jar ()
{
clear;    
cd signing
grep_jar1="$(find . -maxdepth 1 -type f | grep -i \\.jar$ | sed 's/ /ftemps/g' 2>/dev/null)";
grep_jar="$(echo $grep_jar1 | sed -e 's/\.\///g' | sort -f)";
cd ..
if [ "$grep_jar" == "" ];
then
  printf %s "Отсутствуют какие-либо jar в папке signing! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "0" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; signing_jar;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *                    $cyПодпись JAR$c                    *
  *****************************************************
  *     $yВыберите jar$c      *      0 - Вернуться        *
  *****************************************************";                       
for filename in $grep_jar 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read jars;
if [ "$jars" == "0" ];
    then
      apktool;
fi;
if [ "$jars" == "" ];
    then
      jars=1;
fi;
if [ "$(echo $jars | sed 's/[0-9]*//')" == "" ] || [ "jars"=="1" ];
	then
	  file_chosen=${file_array[$jars]};
	  if [ "$file_chosen" == "" ];
      then
        signing_jar;
      else
        cd signing;
        clear;
        cp -f "$file_chosen" > /dev/null 2>&1;
	java -jar ../scripts/signapk.jar -w ../scripts/testkey.x509.pem ../scripts/testkey.pk8 "$file_chosen" ../output/new_jar_signed.jar;
        cd ..;
      fi;
	else
	 signing_jar;
fi;
pause;
apktool;
}
acle ()  
{
        clear
        cd decompile
        rm -rf ../decompile/*/
        rm -rf ../decompile/*
        cd ..
        cd signing
        rm -rf ../signing/*/
        rm -rf ../signing/*
        cd ..
        cd resources
        rm -rf ../resources/*/
        rm -rf ../resources/*
        cd ..
        cd output
        rm -rf ../output/*/
        rm -rf ../output/*
        cd ..
        pause;
        clear
        apktool;
} 
pause ()
{
read -s -n 1 -p "
Нажмите Enter для продолжения";
}
quit ()
{
       clear
       exit
} 
opimizing_apk ()
{
clear;    
cd output
grep_apk1="$(find . -maxdepth 1 -type f | grep -i \\.apk$ | sed 's/ /ftemps/g' 2>/dev/null)";
grep_apk="$(echo $grep_apk1 | sed -e 's/\.\///g' | sort -f)";
cd ..
if [ "$grep_apk" == "" ];
then
  printf %s "Отсутствуют какие-либо apk в папке output! Нажмите "0" для возвращения в меню: "
  read bchoice;
  if [[ "$bchoice" = "0" ]]; 
	then
	apktool;
  else
	echo "$bchoice Неизвестная команда"; pause; opimizing_apk;
  fi;
fi;
count=0;
echo -e "
  *****************************************************
  *                $cyОптимизация APK$c                    *
  *****************************************************
  *     $yВыберите apk$c      *      0 - Вернуться        *
  *****************************************************";                       
for filename in $grep_apk 
 do
 count=$(($count+1));
 filename="$(echo $filename | sed 's/ftemps/ /g')";
 file_array[$count]="$filename";
  echo -e "    $count -$r $filename$c";
done
printf %s "  *****************************************************
  Сделайте выбор: ";
read apkd;
if [ "$apkd" == "0" ];
    then
      apktool;
fi;
if [ "$apkd" == "" ];
    then
      apkd=1;
fi;
if [ "$(echo $apkd | sed 's/[0-9]*//')" == "" ] || [ "apkd"=="1" ];
	then
	  file_chosen=${file_array[$apkd]};
	  if [ "$file_chosen" == "" ];
      then
       opimizing_apk;
       else
        cd output
        clear
	echo "$file_chosen"
	7za x -o"../output/original" "../output/$file_chosen"
	find "../output/original" -name *.png | while read png_file ;
	do
	if [ `echo "$png_file" | grep -c "\.9\.png$"` -eq 0 ] ; then
	optipng -o99 "$png_file"
        fi
        done
        7za a -tzip "../output/temp.zip" ../output/original/* -mx9
	file=`basename "$file_chosen"`
	dir=`dirname "$file_chosen"`
	mv -f "../output/temp.zip" "$dir/optimizing_$file"
        rm -rf "../output/original"
	cd ..
        pause;
        apktool;
      fi;
      else
      opimizing_apk;
fi;
pause;
apktool;
}
apktool ()
{
if [ "$?" == "1" ]
then
  exit 0
fi
clear
echo -e "   
   ***************************************************************************
   ************************      $cy FMD Apktool $c       *************************
   ***************************************************************************
   *              $m APK$c                  *               $m JAR$c                 *
   * 1    Декомпилировать               * 5    Декомпилировать               *
   * 2    Скомпилировать                * 6    Скомпилировать                *
   * 3    Скомпилировать  (без подписи) * 7    Скомпилировать  (без подписи) *
   * 4    Подписать                     * 8    Подписать                     *
   ***************************************************************************
   * 9    Установить опорные ресурсы (framework)                             *
   * 10   Оптимизировать приложение                                          *
   * 11   Очистить рабочие папки                                             *
   * 12   Информация                                                         *
   * 13  $r Выход$c                                                              *
   ***************************************************************************"; 
printf "%s" "   Сделайте выбор: "
read banner
case "$banner" in
1) de_apk ;;
2) co_apk_sign ;;
3) co_apk_nosign ;;
4) signing_apk ;;
5) de_jar ;;
6) co_jar_sign ;;
7) co_jar_nosign ;;
8) signing_jar ;;
9)  sys ;;
10) opimizing_apk ;;
11) acle ;;
12) scripts/info; continue ;;
13) quit ;;
*)
echo "Неизвестная команда: '$banner'"
;;
esac
apktool
}
################### Start ###################
clear
apktool
exit 0
