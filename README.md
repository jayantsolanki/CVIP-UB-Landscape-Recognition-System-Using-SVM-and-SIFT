# CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT

## Project Summary

This project talks about the detailed implementation of different categories based scene recognition using geometric correspondence of different interest points detected on the images using SIFT (Scale Invariant Feature Transform). These interest points are based upon the changing gradient of the pixel intensities and summarized to form the local key descriptors for a particular image. In this project we have used another form of SIFT, known as Dense-SIFT as they are supposed to perform better in the object categorization. Our proposed system builds a representation based on bag of visual words and uses SVM classifier along with spatial pyramid matching for classifying the landscape categories. For classification of images, we tried classifiers like SVM with different kernels and KNN and achieved highest accuracy on linear SVM.
## Documentation
***
Project report can be found at [report](https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/report.pdf) link

## Approach
***
#### General flow of the implementation
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/flow.png" width=50% height=50%>

#### Four Steps of Constructing the Visual Words, courtesy ISRN AI
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/visual.png" width=50% height=50%>

#### Feature extraction using SIFT
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/spm.png" width=50% height=50%>

#### Keypoint detection using SIFT
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/keypoint.png" width=50% height=50%>

## Results
***
We used two datasets of images, first dataset is already avaialble on Web, second dataset has been created by us using the photographs clicked at different places in SUNY-Buffalo:

1. SUN - Data Set: We worked with SUN Dataset which consisted of 8 categories with total 1509 images. Out of these, 160 images were used as testing images and the remaining 1349 were training images.
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/olddataset.PNG" width=50% height=50%>
2. University at Buffalo - SUNY Campus Pictures: We have a total of 532 images. Out of these, 112 images were used as testing dataset (16 images for each category) and the remaining were training images.
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/UBDataset.png" width=80% height=80%>

#### Comparision in accuracy between methods used; 1- Spatial Pyramid Matching (Level 3) with K-Means Clustering (HW1) and SIFT Descriptors with SVM (Proposed method)
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/data1.png" width=50% height=50%>

#### Scene Accuracy on UB Campus Data
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/data2.png" width=50% height=50%>

#### Best Accuracy achieved for UB Campus Data
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/dataBestUB.png" width=50% height=50%>

#### Overall result
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/dataOverall.png" width=50% height=50%>

#### Plot Confusion for Sun DataSet at K = 180 and Alpha = 120, Accuracy: 83.75%, using Support Vector Machine algo with SIFT
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/plotSun.png" width=50% height=50%>

#### Plot Confusion for UB Campus DataSet at K = 180 and Alpha = 500, Accuracy: 93.75%, using Support Vector Machine algo with SIFT
<img src="https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/blob/master/docs/Report/plot.jpg" width=50% height=50%>

#### Conclusion
In this project, we attempted to improve the performance of scene classification using a different method for feature extraction and classification. For feature extraction, we used SIFT and SURF for keypoint detection on images. We found out that SURF is efficient than SIFT, but SIFT is more robust. Using SURF, we got an accuracy of 74% and using SIFT, we achieved an accuracy of 86%. Also, we tried different classifiers such as linear SVM and KNN. Linear SVM provided far better accuracy than KNN.
## Folder Tree
***
* [**docs**](https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/tree/master/docs) contains documentation and paper
* [**release**](https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/tree/master/release) contains implmentation codes and libraries
* [**data**](https://github.com/jayantsolanki/CVIP-UB-Landscape-Recognition-System-Using-SVM-and-SIFT/tree/master/data) contains image data


## Software/Hardware
***
1. MATLAB R2017a
2. vlfeat-0.9.20
3. Intel i7, 16GB RAM, Windows 10

## References
***
1. The Pyramid Match Kernel: Discriminative Classification with Sets of Image Features, Kristen Grauman and Trevor Darrell
2. Beyond Bags of Features: Spatial Pyramid Matching for Recognizing Natural Scene Categories, Svetlana Lazebnik, Cordelia Schmid, Jean
Ponce
3. Distinctive Image Features from Scale-Invariant Keypoints, David G. Lowe
4. VLfeat: An open and Portable Library of Computer Vision Algorithms, Andrea Vedaldi, Brian Fulkerson
