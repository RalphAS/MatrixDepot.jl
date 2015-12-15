matrixdict = Dict("hilb" => hilb, "hadamard" => hadamard,
                  "cauchy" => cauchy, "circul" => circul,
                  "dingdong" => dingdong, "frank" => frank,
                  "invhilb" => invhilb, "forsythe" => forsythe,
                  "magic" => magic, "grcar" => grcar,
                  "triw" => triw, "moler" => moler,
                  "pascal" => pascal, "kahan" => kahan,
                  "pei" => pei, "vand" => vand,
                  "invol" => invol, "chebspec" => chebspec,
                  "lotkin" => lotkin, "clement" => clement,
                  "fiedler" => fiedler, "minij" => minij,
                  "binomial" => binomialm, "tridiag" => tridiag,
                  "lehmer" => lehmer, "parter" => parter,
                  "chow" => chow, "randcorr" => randcorr,
                  "poisson" => poisson, "neumann" => neumann,
                  "rosser" => rosser, "sampling" => sampling,
                  "wilkinson" => wilkinson, "rando" => rando,
                  "randsvd" => randsvd, "rohess" => rohess,
                  "kms" => kms, "wathen" => wathen,
                  "oscillate" => oscillate, "toeplitz" => toeplitz,
                  "hankel" => hankel, "golub" => golub,
                  "companion" => companion,
                  "prolate" => prolate, "deriv2" => deriv2,
                  "shaw" => shaw, "wing" => wing,
                  "foxgood" => foxgood, "heat" => heat,
                  "baart" => baart, "phillips" => phillips,
                  "gravity" => gravity, "blur" => blur,
                  "spikes" => spikes, "ursell" => ursell
                  );

matrixclass = Dict("symmetric" => ["hilb", "cauchy", "circul", "dingdong",
                                   "invhilb", "moler", "pascal", "pei",
                                   "clement", "fiedler", "minij", "tridiag",
                                   "lehmer", "randcorr", "poisson", "wilkinson",
                                   "kms", "wathen", "oscillate", "prolate", 
                                   "hankel"],

             "inverse" => ["hilb", "hadamard", "cauchy", "invhilb",
                           "forsythe", "magic", "triw", "moler", "pascal",
                           "kahan", "pei", "vand", "invol", "lotkin",
                           "clement", "fiedler", "minij", "tridiag",
                           "lehmer", "poisson", "kms" ],

             "ill-cond" => ["hilb", "cauchy", "frank", "invhilb",
                            "forsythe", "triw", "moler", "pascal",
                            "kahan","pei", "vand", "invol", "lotkin",
                            "tridiag", "rosser", "randsvd", "kms", 
                            "oscillate", "prolate", "golub"],

             "pos-def" => ["hilb", "cauchy", "circul", "invhilb",
                           "moler", "pascal", "pei", "minij", "tridiag",
                           "lehmer", "poisson", "kms", "wathen", "oscillate"],

             "eigen" =>   ["hadamard", "circul", "dingdong", "frank",
                           "forsythe", "grcar", "pascal", "invol","chebspec",
                           "lotkin", "clement", "fiedler", "minij",
                           "tridiag", "parter", "chow", "poisson", "neumann",
                           "rosser", "sampling", "wilkinson","wathen", 
                           "oscillate"],

             "sparse" => ["poisson", "neumann", "wathen", "blur"],

             "random" => ["rosser", "rando", "randcorr", "randsvd", "rohess",
                          "wathen", "oscillate", "golub"],

             "regprob" => ["deriv2", "shaw", "wing", "foxgood", "heat", 
                           "baart", "phillips", "gravity", "blur", 
                           "spikes", "ursell"],
               );
