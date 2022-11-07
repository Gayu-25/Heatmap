library(circlize)
data<- read.csv(count_docvisit.csv)
print(data)

count_docvisit <- read.csv(file = 'D:/MSc Bioinformatics/Sem3/Cancer genomics/count_docvisit.csv')
head(count_docvisit)

set.seed(123)
nr1 = 2; nr2 = 4; nr3 = 6; nr = nr1 + nr2 + nr3
nc1 = 6; nc2 = 4; nc3 = 8; nc = nc1 + nc2 + nc3
mat = cbind(rbind(matrix(rnorm(nr1*nc1, mean = 1,   sd = 0.5), nr = nr1),
                  matrix(rnorm(nr2*nc1, mean = 0,   sd = 0.5), nr = nr2),
                  matrix(rnorm(nr3*nc1, mean = 0,   sd = 0.5), nr = nr3)),
            rbind(matrix(rnorm(nr1*nc2, mean = 0,   sd = 0.5), nr = nr1),
                  matrix(rnorm(nr2*nc2, mean = 1,   sd = 0.5), nr = nr2),
                  matrix(rnorm(nr3*nc2, mean = 0,   sd = 0.5), nr = nr3)),
            rbind(matrix(rnorm(nr1*nc3, mean = 1,   sd = 0.5), nr = nr1),
                  matrix(rnorm(nr2*nc3, mean = 1,   sd = 0.5), nr = nr2),
                  matrix(rnorm(nr3*nc3, mean = 1,   sd = 0.5), nr = nr3))
)
mat = mat[sample(nr, nr), sample(nc, nc)] # random shuffle rows and columns
rownames(mat) = paste0("row", seq_len(nr))
colnames(mat) = paste0("column", seq_len(nc))

View(mat)

Heatmap(mat)

col_fun = colorRamp2(c(-2, 0, 2), c("Grey", "white", "Pink"))

Heatmap(mat, col = col_fun)

