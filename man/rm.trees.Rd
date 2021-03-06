\name{rm.trees} 
\alias{rm.trees}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Remove trees from a random Uniform Forest
}

\description{
 Remove any number of trees from a random Uniform Forest, especially in case of incremental learning.
}

\usage{
rm.trees(rufObject, X = NULL, Y = NULL, 
	method = c("default", "random", "oldest", "newest", "optimal", "quantile"), 
	howMany = NULL, 
	rm.sample = 0.1)
}

\arguments{
   \item{rufObject}{
     a object of class randomUniformForest.
}
 \item{X}{
     a validation sample, in case of removing 'method' is "optimal". 
}
 \item{Y}{
     a vector of responses for validation sample.
}
 \item{method}{
     method to used for removing trees. Note that "optimal" and "quantile" are not fully tested and can lead to unexpected results. "default" work only if OOB evaluation is not missing. Use "random" if only one forest has been set. If ensemble of forests (e.g. incremental learning), use "oldest" or "newest" (but a validation sample may be necessary).
}
 \item{howMany}{
     how many trees to remove ?
}
 \item{rm.sample}{
     if method = "random", 'rm.sample' is the proportion of trees to remove.
}
}

\author{
 Saip Ciss \email{saip.ciss@wanadoo.fr}
}

\examples{
## Classification : "breast cancer" data 
## (http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+(Diagnostic))

## data(breastCancer)
# breastCancer.data <- breastCancer 

## remove ID (first column) and divide data in train and test set
# breastCancer.data = breastCancer.data[,-1]

# n <- nrow(breastCancer.data)
# p <- ncol(breastCancer.data)

# trainTestIdx <- cut(sample(1:n, n), 2, labels= FALSE)

## train examples
# breastCancer.data.train <- breastCancer.data[trainTestIdx == 1, -p]
# breastCancer.class.train <- as.factor(breastCancer.data[trainTestIdx == 1, p])

## rename class in benign (class 2) and malignant (class 4) to have a better view
# levels(breastCancer.class.train) = c("benign", "malignant")

## test data
# breastCancer.data.test <- breastCancer.data[trainTestIdx == 2, -p]
# breastCancer.class.test <- as.factor(breastCancer.data[trainTestIdx == 2, p])
# levels(breastCancer.class.test) = c("benign", "malignant")

## compute many trees in a fast way, removing OOB evaluation
## breastCancer.ruf <- randomUniformForest(breastCancer.data.train, breastCancer.class.train, 
## classwt = c(1, 3.5), maxnodes = 10, OOB = FALSE, ntree = 500, threads = 2)

## predict and see results
## pred.breastCancer.ruf <- predict(breastCancer.ruf, breastCancer.data.test)
# confusion.matrix(as.numeric(pred.breastCancer.ruf), as.numeric(breastCancer.class.test))

## remove some trees at random. Default method can not be used since we don't have OOB data
# breastCancer.ruf <- rm.trees(breastCancer.ruf, method = "random", rm.sample = 0.2)

# breastCancer.ruf # old number of trees is still printed, but trees have been removed

## predict and see results again 
# pred.breastCancer.ruf <- predict(breastCancer.ruf, breastCancer.data.test)
# confusion.matrix(as.numeric(pred.breastCancer.ruf), as.numeric(breastCancer.class.test))
}