package com.uc.paymentsdk.commons.codec;

public interface Decoder {
    Object decode(Object obj) throws DecoderException;
}
