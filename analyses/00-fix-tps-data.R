#--------------------------------------------------------------
# Original TPS files had some extra coordinates that overlapped
# These cause distortions in the analyses so we removed them
# This code is here in case people need the pre-scaled data
# Natalie Cooper 2017
#------------------------------------------------------------ 
# Setup
#-----------------------------------------------------
# Set working directory as the folder for this project
# or open a new project there

# Load geomorph
library(geomorph)

#----------------------------------------------
# Read in the morphology data
# These data are TPS files produced in tpsDig
# a program allowing easy landmarking of images
#----------------------------------------------
# Cranium data
# Read in landmark coordinates
slands <- readland.tps(file = "rawdata/dolphin-crania-unscaled.TPS",
                       specID = ("imageID"),
                       readcurves = TRUE,
                       warnmsg = TRUE)

# Delete semi-landmarks which double up with landmarks
# This was an error made in landmarking but has an easy fix
skull <- slands[-c(13, 17, 18, 22, 23, 25, 26, 28), , ]

# Some of the image IDs are truncated
# Change these so they match the other data files
dimnames(skull)[[3]] <- gsub("ventralf", "ventral.tiff", dimnames(skull)[[3]])

# Write out new TPS file
writeland.tps(skull, "data/dolphin-crania.TPS")

#----------------------------------------------
# Mandible data
# Read in landmark coordinates
mlands <- readland.tps(file = "rawdata/dolphin-mandibles-unscaled.TPS",
                       specID = ("imageID"),
                       readcurves = TRUE,
                       warnmsg = TRUE)

# Delete semi-landmarks which double up with landmarks
# This was an error made in landmarking but has an easy fix
mandible <- mlands[-c(9, 11, 12, 14), , ]

# Some of the image IDs are truncated
# Change these so they match the other data files
dimnames(mandible)[[3]] <- gsub("dorsalf", "dorsal.tiff", dimnames(mandible)[[3]])

# Write out new TPS file
writeland.tps(mandible, "data/dolphin-mandibles.TPS")


#----------------------------------------------
# TURSIOPS data for repeatability analyses
#----------------------------------------------
# Cranium data
# Read in landmark coordinates
slands2 <- readland.tps(file = "rawdata/tursiops-crania-unscaled.TPS",
                       specID = ("imageID"),
                       readcurves = TRUE,
                       warnmsg = TRUE)

# Delete semi-landmarks which double up with landmarks
# This was an error made in landmarking but has an easy fix
skull2 <- slands2[-c(13, 17, 18, 22, 23, 25, 26, 28), , ]

# Some of the image IDs are truncated
# Change these so they match the other data files
dimnames(skull2)[[3]] <- gsub("ventralf", "ventral.tiff", dimnames(skull2)[[3]])

# Write out new TPS file
writeland.tps(skull2, "data/tursiops-crania.TPS")

#----------------------------------------------
# Mandible data
# Read in landmark coordinates
mlands2 <- readland.tps(file = "rawdata/tursiops-mandibles-unscaled.TPS",
                       specID = ("imageID"),
                       readcurves = TRUE,
                       warnmsg = TRUE)

# Delete semi-landmarks which double up with landmarks
# This was an error made in landmarking but has an easy fix
mandible2 <- mlands2[-c(9, 11, 12, 14), , ]

# Some of the image IDs are truncated
# Change these so they match the other data files
dimnames(mandible2)[[3]] <- gsub("dorsalf", "dorsal.tiff", dimnames(mandible2)[[3]])

# Write out new TPS file
writeland.tps(mandible2, "data/tursiops-mandibles.TPS")
