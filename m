Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5158725CC57
	for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 01:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940461; cv=none; b=ObjrRVh+XZLNHitqro/2s2Ay/dqjhfyv5cjyueYsV9dm1O4dussub1k5UHI2yEJEVI2Emolwj9MC3EJjoOEYhmsIxVJNJvZumfu+VNGJZ2rC+15x5MVfO2Jt694Sy3gUT2olsdYTMfB6MBklMFgwbTgoke3yWLMbn4v+/TwLv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940461; c=relaxed/simple;
	bh=73ZSkgvDAc/tEb38F0TL0h/qQE1nmehsX+W+85TKIlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VW4DdOO3/UCAXHEReZtSHvMs44+f92debkQT83C7kFoBCh81wYqfv67tz2/HDlOvewRrd2PZRfcWWTkI8hXxrODFN3xFdSYnm9sRWr604pEUyG3E5DqL/nyq+EkGilmZf6JFWp290qoA3ao4CoM4f7eWEyiERbPGrNRCZ0fWSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CO6NDMK4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CO6NDMK4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso25648865e9.2
        for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 18:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791940458; x=1792545258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IRGY42o0foxKofOSIE21b7k7cypUKnC6DpjmgjMdLE=;
        b=CO6NDMK43wiKPojMSSW1HF3u0mstSOPLyi8tY2H6Nlsljlo52qgIGTdCQYd2TL7+b9
         0nakKlqYTz44tcHOFJpxhjHfMVl+4m3Jl/UYlZoBjPZtDeulxXD+VE5ySnVdsfl56Ofp
         XhJK0xsaB5+DAFWrKMAMs/7OlBTinUNtsf2WZONpIWqvpMUP7q0PzAcidAEIKgbEnqVS
         EfIn2Y64MePjoMFqN41bru7prUO2rfNHlCmoW4STOySXfFl5McK/pJO06QSCUM1T9aC6
         7+wfEPHVoCS77Tvrt62ToQMUweDdvEDpkDcvMZvBpWJUn9JPERbPkiT0IjiFPbDCZ46P
         DEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940458; x=1792545258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IRGY42o0foxKofOSIE21b7k7cypUKnC6DpjmgjMdLE=;
        b=WhbEa56nAj5W0+EfHj75I8MMHghxNyU/r4CT9LEod+AxVuA7TGTz+q+ej7Pr35t/jq
         OGk8U8sPX5Ackfgv7Kn3831/W708DSnGk5u9BaSe8ayPoVqGsZ6qV6SVqgt5CNSW9MeZ
         k3I4FWsUaChBor/dxkD9mJMPKYJvtMqrjgzqWzc/f03UVTxnpG0H9tkrped962YcQW/U
         cOdQdW4Bt4KXg8XxzBU4gdjhOVmFynbNNF0d557HkfGb+cA6aKg3L5w6DsRgFZAwmEzL
         GaWXDiRH8ZV8SM8WZZr2NVExyOmlrd4Jj8ozEuz41y10geRhVtADi4rfUKTt3h/gNx25
         Pz+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/6UesFwDBPkzD5a2Gvs8vR4/5ltg8PV9UR7nt9nHIC6sLIePBSRABKv3nxKfjJKNxiWVU1gUS7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKw/1hedhDZ+3jL7U9sqkuBlKHADbQttrzHNTdCz/OMM8pHE82u
	H0F+kSq03RneBBQPEdpolp0DPWqAttgYY3Lz2WVd48sNI8YACwh53dFv
X-Gm-Gg: AYBFou09tWBdjj/Ok1yTvKNByKbt/lo8RS9AU3lQD17acChh85OPvc7XJx0DVeG0NNW
	zP+notdqGonNZzbo3YbVJKW0z40zqg0vTtW4YObZez5kHAdD2t0Uw1T2VSEOWcbqrTqmtxyTtM7
	7375xqIQlaZ7+xwoWIt1iSyvJwfVDL9Ox6nhup5mEU0/GoDW3X8yU0gnOkilMLOL6gyJCej0NRJ
	GsVPJ3zXhmCjSVJPcAKT/4BXAS2+UUWcy+PYfMNPgR9a1WlNODYMdvEdpJKQIf0yQFSavrjhRtt
	a+jmd+ev+2dd0oQMhSZWcqiSUrZj5+inpFFJ5YuDt8QmB02SgKujbc9LRo+zxXPVJjZmq/NlZ2K
	xCg4fanpAAsfFdu2Rm2OBksMtDcEcnujVEroFZrm5EJO/6sGF385mHsKjGEM5z5ShuxNBnCYtQy
	SvCWQEtcznSvS3l8GiNXHOGY+ITZDH1dGtbBZVTCZAhgaut6beW5NcXEMx72j3vHsRl6SxRXpdr
	9AxtVwenLEC/CsesJSun4yFBCV2ew1zfs1ZMGtKa5utgtw1CV+T2kn4RdCmN6Z2M6y2aj1xuoY1
	Le9J6iX85nP0k96xzEE6LbhroyprvcGypkK6/Z7tzOf1BrGB
X-Received: by 2002:a05:600c:3111:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a18e49d640mr279688285e9.8.1791940458506;
        Tue, 13 Oct 2026 18:14:18 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b748cbfdsm4389935e9.0.2026.10.13.18.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 18:14:17 -0700 (PDT)
Message-ID: <86ae9136-3413-45b2-99b0-fbe404ef1b39@gmail.com>
Date: Wed, 14 Oct 2026 02:14:16 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/cmd_net: prevent infinite retry loop on
 unextractable timestamp skb
To: Bui Viet Dung <dungvn2345@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Willem de Bruijn <willemb@google.com>, lollipopkit <a@lolli.tech>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20b406ac-94ec-4b0f-a307-08082092ae08@gmail.com>
 <6ac7afc4.cf15ae49.1a8a2a.2a55@mx.google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <6ac7afc4.cf15ae49.1a8a2a.2a55@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

n 10/8/26 15:59, Bui Viet Dung wrote:
> On Thu, Oct 8, 2026 at 3:43 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
>> Sounds fine since there are only timestamp skbs in this list, do
>> you have a test case?
> 
> Hi Pavel,
> 
> Thanks for the review.
> 
> The issue was spotted during code inspection of the error handling path
> in io_uring_cmd_timestamp(): specifically when skb_get_tx_timestamp() returns
> a negative error (e.g. -ENOENT due to missing PHC bindings with
> SOF_TIMESTAMPING_BIND_PHC or unavailable timestamp data). Since the
> multishot apoll remains armed on EPOLLERR and the unhandled skb is spliced
> back onto the head of sk_error_queue, it immediately re-triggers the command
> in a tight busy-loop.
> 
> Below is a standalone test program demonstrating the TX_TIMESTAMP command
> setup and execution with CQE32:

Did you actually reproduce it? This program doesn't for me, nor does
fault injection. Taking a look at the code, io_uring_cmd_timestamp()
returns -EAGAIN, and the request will wait for the next wake up in the
polling code. There are bits to improve, but that's not an infinite loop.

-- 
Pavel Begunkov

