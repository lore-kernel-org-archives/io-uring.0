Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289015;
	b=FiXiQ2rSx+xPSzdcvMXRKkH4wfKGI7KPMTOk6PaqQRNbDzTDxwfXjyyBdy4vNbW033Q5
	 jqWq4iqSFK8ZKdHyZTccfjPZs3IAYggiQ76s6OMKu15qQltgU8Fx9/kq0aZWo+o2X41z8
	 NuyKapADBzxKaAyaZbEVsl0SDNJPd13/z10QD0yqCFKSBEqAPn6fqFYVNont6FbCGA56S
	 RQWGFOUSbrr6SUJgCnisTWWvrjXHpOF8snN+aYR5b1dVKxcbG2D9TLlz00vCLx/qZCKkP
	 170ybS7sGavuv92C9eFnIiGhvEtXJTiwt8hMreVpdxv+7r4E2bWuCMrKMocwrxkpk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=aJzBEwj2+x4j6CDStwSGH+/h447AGr3HtflqjrkNNp8=;
	b=Ed1UBjycraLoY0UW+nSvLjdv9gDyU2ksOqMQfeuYp9IwXtWlB/0BYXpL7O/Ymclhmrmz
	 dTDDpdmMimJFMSSVgq27U70TYeKrHXDqMyqRdnRl8rewaDFRnt3ccIlDE17j8Jcl2UwFV
	 IvmoElEtTH+JieoTzkG06DJ5FolSN2GaIvgjtDuU9VEhZfv+vU2ijYvjNePKP293RAWTm
	 YH3S07aIn2UXaDoHzx+OU5HZcHnDfH6FzToAHIYUJJalyoE5xXqQZSyp41EdBZwDLa+z8
	 Tx31Dn4kJw1NlZdGDpFSk/g84s9AUtuMCNW3TUh0q3htgKIeqooKYtRclrmUSPEx4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sPn9Zjxu;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1DB606A31D
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 15:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1DB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sPn9Zjxu
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-47b47de8b4cso1373459fac.3
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793289008; x=1793893808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJzBEwj2+x4j6CDStwSGH+/h447AGr3HtflqjrkNNp8=;
        b=sPn9Zjxu/OgUIzLpljYFMA3n+mK4KEEUft17iahwWOyuzygHD6vArleT8TDLvcGFyz
         ztbKajILsvA+3IUrxTWIisN+VMPap49vjpQfimOkVfmpFR1bSnbc5LU7gFtTYLTbpRxh
         IKWA943bwIzlf4RkYYQWuSeZQVSUPGX/uvJSUXIbh7lJTjHySrj6oCT9kHAOvdCgx73c
         mAHxVIbgR0MBRzt6h6jwOl5xRh10mOVv8cpxCb3G2860Q8uk5IsPqBZ0rMEeHS1EK34e
         ZrwcRh6AgPYcd0vvJoW5TCEaFByyb9LdQgTQbkzedvI9m4XQ7SjU/WzTJQcf7ALid+VX
         H7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289008; x=1793893808;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJzBEwj2+x4j6CDStwSGH+/h447AGr3HtflqjrkNNp8=;
        b=1J2pj/lJCkLulWNH9ByPUlEcMgq0K6KV1Eu+EI9dQiMDexoGuTJwznRRh1QIUwzFs+
         JllarWUW/O1UOkacK49Rs2YDg+NTIicy44c36c71QlMQ4LTn+Tw41sJPBK0p4GDgzrRf
         wIujJjGKV5qyfR5nDU7rkMNWjvvgXE0rLNQh0TSPyJ+1KxawGsZqZ9PZwJ/czbCZLPBx
         qlhNbPh7QmO4+v6VL/2ljYpzuB0xltl8JmZvSSvnWhKCT/M9iz6CD7/sqC2Bn2f6+m8n
         /i+lp1YFS4CdneR6drM1AwyboIopiKBIXy1UXwIDZDnG7KWvsegchq3ltOG2weZ618/T
         oeug==
X-Gm-Message-State: AFq9FYJ/vwXp5hwmRXpV0QGbLEiXsSKfPYCbsd2LoTw8V4a+JF+nE9NT
	x812Ytncz7q677IDAIhvXvH3TKJpXKbrbfVJ3GpoeXmT5Lnmh4oU3EHaOo7X1BIvkdv75iCZOq1
	CIbWvaZs=
X-Gm-Gg: AYBFou02ZrUlcSaZnVSZwY4zBWVlqK4IUfIsOxtkwL35RjdsdqNHf8okPHU9ziPCcrX
	r2vXYD1eAgotBWcpoqdeAQRFDpgzru0yZKq/WoQgrmATL4sUPurPl4GJkBuwGcmnRPZiHrsYL0o
	mZKiAovCiNXdyBH9tLwCeeb4FSoDwflE+eKD+KO+JTq3cMYI54TJQEi8IgKaHJaEsEqI3+qJrOd
	6l7ShY+MTwYv9prQu1KCIaOte1o4ibnbFcJicIqb8DmYZf+Bs943juyiHuNVMczX3wicLh8wPuv
	a2wQ8SA5FTZ+wgv0jBTHJ7yzyrYDoca358e/yewZbuI/hRyyPCzdwMvzI3HGF//OQX0p9dwt7B0
	wXqtj/gedtnqqO+T7rocUiV/YXvv2KJthXAy1C9AEpjgCAplGQMBWoe02DCK9OYOuDdfWl/iQ+L
	nCcDSRw62Rs5zWo1V4NtJhzIzYkhn70KLrIQPETxTxmF4OtlfCHZ5e0xmVo2NkrRJWbrWwK3Wak
	IWoa9b619i9YTRJvXLn6DcYwQO7i/35K7mySD8x9v9toqD1MZdoWKV+QSYrwu3cTjMpxrGiMeb3
	0YOjqT5/v+I6P/eXhW+zz3vDc5BmFA9bbkI93jshFOtOF0HQKExyrXhZW4ANHUrFMZByrT7gn0b
	OzYx8wLo3AA==
X-Received: by 2002:a05:6870:a58b:b0:48f:e21e:1e6d with SMTP id 586e51a60fabf-4a8bb5b9483mr4141687fac.48.1793289008181;
        Thu, 29 Oct 2026 08:50:08 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a901ff3779sm124024fac.4.2026.10.29.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:50:07 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <179328314078.648427.10086632105828535293@gmail.com>
References: <179328314078.648427.10086632105828535293@gmail.com>
Subject: Re: [PATCH] io_uring/net: fix multishot recv length limit
 accounting
Message-Id: <179328900747.1492023.9396413933198916424.b4-ty@b4>
Date: Thu, 29 Oct 2026 09:50:07 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 29 Oct 2026 07:12:20 -0700, Cheng Yongkang wrote:
> io_recv_finish() debits sr->mshot_total_len with min_t(int, sel->val,
> sr->mshot_total_len).  sel->val is the cumulative byte count of the
> request: on a bundle retry the receive path adds sr->done_io back to the
> return value, and the bundle branch in io_recv_finish() recovers the new
> bytes with this_ret = sel->val - sr->done_io.  The debit therefore uses
> the wrong value after a bundle retry, and the int cast truncates a limit
> above INT_MAX.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: fix multishot recv length limit accounting
      commit: 3e3aebb7570ccdde5cc49c9bfc8fd3a436b71b0c

Best regards,
-- 
Jens Axboe



