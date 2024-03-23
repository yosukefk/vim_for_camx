destination=$1
echo "dest is $destination"

if [ x$destination == x ]; then
	echo usage: $0 destination
	exit 1
fi

if [ ! -d $destination ]; then
	echo install camx first to destination: $destination
	echo usage: $0 destination
	exit 2
fi


for d in CAMx Includes Mod_src IO_bin IO_NCF CMC CF_AERO CMU_AERO SOAP PiG HG OSAT DDM PA RTRAC MPI Dummy_MPI Dummy_NCF MPI/util
do
	if [ ! -d $destination/$d ]; then
		echo expected dir not found: $destination/$d
		echo install camx first to destination: $destination
		echo usage: $0 destination
		exit 2
	fi
done


# ready to go!
cp -r vim  $destination
cp vimrc $destination/.vimrc
for d in CAMx Includes Mod_src IO_bin IO_NCF CMC CF_AERO CMU_AERO SOAP PiG HG OSAT DDM PA RTRAC MPI Dummy_MPI Dummy_NCF 
do
	echo "source ../.vimrc" > $destination/$d/.vimrc
done
for d in MPI/util
do
	echo "source ../../.vimrc" > $destination/$d/.vimrc
done

cat << ieof > $destination/.ctags
--recurse=yes
--exclude=.git
--exclude=BUILD
--exclude=.svn
--exclude=\*.sw?
ieof

cd $destination
ctags 



