# Classification-Algorithms
In this repository, several classification algorithms are implemented on the MNIST or Fashion-MNIST dataset


## I. Averaged Perceptron on Fashion-MNIST 

Freud & Schapire (1999) introduced the voted-perceptron algorithm which has memory complexity O(k),where k is the number of times a sample is misclassified during a training. In this notebook, we aim to derive a novel, more efficient, perceptron algorithm inspired by the voted perceptron with memory complexity O(1).

## II. CNN on Fashion-MNIST 
A convolutional neural network (CNN) is a type of artificial neural network used in image recognition and processing that is specifically designed to process pixel data. In this notebook, a convolutional neural network is implemented using cross-entropy loss and trained on the Fashion-MNIST data set. 

## III. Polynomial Kernel Perceptron on MNIST 

The kernel perceptron is an online One-vs-All algorithm. That is, it operates on a single example (x,y) at a time. It is a generalization of the perceptron algorithm in two ways :
  - The usage of a kernel function allows to generate a non-linear separating surface
  - We may go from 2-class classifier to k-class classifier
