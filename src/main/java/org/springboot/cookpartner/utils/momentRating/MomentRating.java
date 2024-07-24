package org.springboot.cookpartner.utils.momentRating;

import org.springboot.cookpartner.config.MyConfig;

import static com.hankcs.hanlp.corpus.tag.Nature.nb;

public class MomentRating {
    public static String rating(String review) {
        HanLpClassifier.initClassifier(null, "./nb-classifier-for-weibo.ser");
        return HanLpClassifier.getClassification(review);
    }
}