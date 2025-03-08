package com.uc.paymentsdk.commons.codec;

public interface Encoder {
    Object encode(Object obj) throws EncoderException;
}
