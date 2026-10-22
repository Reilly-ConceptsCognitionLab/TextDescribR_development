module load fsl

. ${FSLDIR}/etc/fslconf/fsl.sh

projDir=/projects/p32980/atlasquery
rm ${projDir}/atlas_overlap_subcortical.txt
rm ${projDir}/atlas_overlap_cortical.txt



componentList=("vol0001" "vol0003" "vol0005" "vol0008" "vol0009" "vol0010" "vol0011" "vol0012" "vol0013" "vol0016" "vol0018" "vol0019")

for comp in ${componentList[@]}
do

  fslmaths ${projDir}/${comp}.nii.gz -thr 4 -bin ${projDir}/${comp}_binmask.nii.gz

done



for comp in ${componentList[@]}
do


  echo -e "\n \nthis is component " ${comp} >> ${projDir}/atlas_overlap_subcortical.txt
  atlasquery -a "Harvard-Oxford Subcortical Structural Atlas" -m ${projDir}/${comp}_binmask.nii.gz >> ${projDir}/atlas_overlap_subcortical.txt

  echo -e "\n \nthis is component " ${comp} >> ${projDir}/atlas_overlap_cortical.txt
  atlasquery -a "Harvard-Oxford Cortical Structural Atlas" -m ${projDir}/${comp}_binmask.nii.gz >> ${projDir}/atlas_overlap_cortical.txt


done
