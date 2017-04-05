bash ./datasets/download_dataset.sh ae_photos
bash ./datasets/download_dataset.sh apple2orange
bash ./datasets/download_dataset.sh cityscapes
bash ./datasets/download_dataset.sh facades
bash ./datasets/download_dataset.sh horse2zebra
bash ./datasets/download_dataset.sh maps
bash ./datasets/download_dataset.sh summer2winter_yosemite
bash ./datasets/download_dataset.sh monet2photo
bash ./datasets/download_dataset.sh vangogh2photo
bash ./datasets/download_dataset.sh ukiyoe2photo
bash ./datasets/download_dataset.sh cezanne2photo
bash ./datasets/download_dataset.sh iphone2dslr_flower

mkdir /output/datasets

pushd ./datasets
mv ae_photos /output/datasets/
mv apple2orange /output/datasets/
mv cityscapes /output/datasets/
mv facades /output/datasets/
mv horse2zebra /output/datasets/
mv maps /output/datasets/
mv summer2winter_yosemite /output/datasets/
mv monet2photo /output/datasets/
mv vangogh2photo /output/datasets/
mv ukiyoe2photo /output/datasets/
mv cezanne2photo /output/datasets/
mv iphone2dslr_flower /output/datasets/
