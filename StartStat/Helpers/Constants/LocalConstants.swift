//
//  LocalConstants.swift
//  StartStat
//
//  Created by John Nik on 1/20/18.
//  Copyright © 2018 johnik703. All rights reserved.
//

import UIKit

let DEVICE_WIDTH = UIScreen.main.bounds.size.width
let DEVICE_HEIGHT = UIScreen.main.bounds.size.height

//constant when keyboard show
let kOFFSET_FOR_KEYBOARD: CGFloat = 120.0

let Z_TEST = "Test the difference between\ntwo proportions\n(Z-test Calculator)"
let T_TEST = "Test the difference between\nmeans for two groups\n(T-test Calculator)"
let SAMPLE_TEST = "Provide \"margin of error\" for\nyour sample size\n(Sample Precision Calculator)"

let NOTICE = "Documentation and original code copyright 1995-2018 by DataStar, Inc. (Waltham, MA). Reproduction of material for non-commercial purposes is permitted, without charge, provided that suitable reference is made to StarStat and DataStar, Inc. by including this notice intact.\n\nNeither StarStat nor its documentation should be modified in any way without written permission from DataStar, Inc."
let DISCLAIMER = "StarStat is provided \"as is\" without warranty of any kind. The entire risk as to the quality, performance, and fitness for intended purpose is with you. You assume responsibility for the selection of the test and for the use of results obtained."

let Z_TEST_HELP = "Tests the difference between two proportions. Confidence levels computed provide the probability that a difference at least as large as noted would have occurred by chance if the two population proportions were in fact equal.\n\nTo run a z-test, you will be prompted to provide the following:\n\n  • Proportions for the two groups\n  • Samples sizes for the two groups\n\nBoth one- and two-tailed probabilities are computed using the data specified. As well as displaying actual probability levels, StarStat provides \"broad\" level of testing at 80%, 90%, 95% and 99% confidence levels, using 2-tailed tests."

let T_TEST_HELP = "Tests the difference between means for two groups. The t-test procedure computes the \"Student's t\" statistic for testing equality of means of independent samples. Confidence levels computed provide the probability that a difference at least as large as noted would have occurred by chance if the two population means were in fact equal.\n\nTo run a t-test, you will be prompted to provide:\n\n  • Means for the two independent groups\n  • Sample sizes for the two groups\n  • Standard errors of the two means\n\nBoth one- and two-tailed probabilities are computed using the data specified. As well as displaying actual probability levels, StarStat provides \"broad\" level of testing at 80%, 90%, 95% and 99% confidence levels, using 2-tailed tests."

let SAMPLE_TEST_HELP = "Provides \"margin of error\" for desired sample sizes. It is helpful in answering questions like...\n\n  • How large a sample do I need?\n  • How reliable is my research study\n     overall?\n\nThe only input required is a sample size.\n\nStarStat provides sample precision ranges at 80%, 90%, 95%, and 99% confidence levels."

