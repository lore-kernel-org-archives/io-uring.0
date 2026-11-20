Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192473;
	b=O9+zP0OiQ3HWgK6egkPPbB4sYrAB21NCT94neixBKLgOO2JMf+kQeexW9k2zwxSfTsKO
	 KtfPzRdnKQMxgQxScG9g+ohfF/FA7++3l4r6eaKzAV8UKKp3jyCaryyx4cAz2gIAknIoF
	 jOA4wl9xHgM2oWG79NCGkrisVKNMQN7I41dHh/WrMUZ1CSAm45nQE/2qrQhi1KC6gy3N6
	 atN1+bA2RMABVQIIp/U637KNwNZ2qe/4jt61XpT5bWMNn1zcjaG6sjhoNuRZ9TsdoBfrX
	 b4dpUwDij73ucuOqJXxHdnRTnHtmuADxXYnfia5QzxLaxW5SctvOTKt7IF5lcYRxMtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=c1Rcr1MG9hY9GluuOfSjwXRdDdQ4SancKFKcdqDjkVg=;
	b=4sytFuX+T2waBUe/wuFf1OSlsP8pAzZbKqflcGN+Lp+bvRa+Rl7xBnqP29w2AjkCAqVN
	 gIDVUb/ffYrBoD8O+6qtf7vneNfgdI38cYea9Q9CEHups8vOGNCr3cSbL5Of+MI/EOQbQ
	 ZVqZrg4Pb+gvAZVz2rF/cbRQr7utk4HWybFSWid7xlpQicw+IDr0qfAq0KkSY/yA0DtgN
	 OeIu+fJi4hXFqH7gLps436CEcXdbL+dtdMmZPJPKEvSc5EC1TykFX/jyQA1sZMj8UmDKw
	 HzEW9ieuWmGhlPGD2ynKI986IWoSSMpWf7y6FqZzTHPgzKIryXUhhL4kEkwjhmCcq7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ncy1yMiT;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99871606A325
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 16:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99871606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ncy1yMiT
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b28d7c729fso840776b6e.0
        for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 08:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795192470; x=1795797270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1Rcr1MG9hY9GluuOfSjwXRdDdQ4SancKFKcdqDjkVg=;
        b=ncy1yMiTu4EtP79tQOZos0QLbejJNFuqyBgDR9X3iyW+hfAww4Ad3m0/1iceuQ78Ut
         VRW2j6b9nDSOQvQs/+uq2R+UrcOlaH9d1t2I850rVpi9SzQ4JRf1ptc+gYAbNv6Hs/J6
         usT0lZbX6dWWFsTS2+wOAPug/LppyTiL7RKlF4lleCju/VPCFBWF/p7U0KXSuuSiCTh7
         bP2gw5aDHGEgcRKdMkXihybWs1CFKqvdsmqa0GSbMz0o0PqfYpvSyVbp0l71QTWt29+H
         Z+i4uhhz3vCDYj6+Gb2wqR3CTvSbGMb3+URG0ThzQYaytxUVeZuFNkIzVfT0r55eBaKb
         lE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192470; x=1795797270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1Rcr1MG9hY9GluuOfSjwXRdDdQ4SancKFKcdqDjkVg=;
        b=vi7AwrM8jG3zhVuInyk5EIulzli+qich4r2QlFh9X4PGamXulfpXvSfSS6BOOIBqzT
         Kdm+cz+j6tFL1l2O3/OWympdumdlQL0/f1U4UCf6ZNtMG2jmCrENfs71AfxPmKsQPJgR
         F0VQDZzaTikmFC06MNIxWLmLo+moncBQK7ABV8LiieK9IlXiY1S5f/7cybshp1Rss2NU
         vRnP/t5PjoLQNX0+xMeI1DzFHdRj86kcmspXGi9Dn+Bwv2LzZOsUwrpRLQDmsZ2Uxu6C
         sQbESVRqkGk1pBde/aTxWfbdJj3jbZzXzLFSGonhsunc8W0wZG0rz51Zt+cGN2dh0gvU
         TSHQ==
X-Gm-Message-State: APuU4Z/O/N6DJagIkmRGXzhSfW9sKT0roRPvh+osVgy49w79IKETMnkU
	fgqGN8wEDoHoBDNh92+sT4orsqTBaGYPsTJAPrepROvDe7udHDYhjiIasgTazNDYJs4=
X-Gm-Gg: AYBFou05ptlpyI8ycjrrXt++cUoODV8H4hxHicLM8cuUeSYMMnlGQMA7T3ckJZ/lLAQ
	oec/Uzf4egHfV4X9vzWRH4PFtt4fHjGpoK0ieJtW+1Ij8MnIoMKnG4LFMB0wvjYK1gukQmMX+Xq
	U2wSSatJHASUhN1qZuNWdKvQ+lZJJI8x7qZAM87K51eyUIzsOmwGUBWRzBTDQR0a6aFHOOIsbXN
	qIYth38d0dPgBXgwaBjCj7glR//Ge4r88jKMzttn8isKx+7tqmvrNYCPDkHo7Mq7/eNB12z7iHL
	QuTz3iv23bJfgEX5MKXwmS3Ke3ZjHcHX1W3xY1ofP5j3vcL/BoEcr9iX3ZFC3sQWlp+xBUtDYzY
	4MqmZtAH4Qz6WRqG9pxsjHI7XiSu2xBP4OsdvpJk/EUhXjhLBKIyHljf1OH8htLCMq98fP2rtUM
	v7viJuKxK9lbMYHltr1HKoCDbxyZRIJVn4dpK5nWfJFntZFhRePjDU7Vm8VNlanGcNqej9Py2Yq
	+SIs9i3tEPFn/DcFSK/GVZ6rmOzwykq1Zjs6azfoMcst8vD7pyEIHkmu5V3lmUqMY5WXjly7TM3
	rqMSgqtEbNODsTmvhVVDm27xgITXvLismRU6lBG/DnXf+5g9L2ucUo2gyvLWcR3wr04EesYYRh/
	SIWI2CjnvNxhPV22mCNF/VTZn9qivCdsYg5KXYlKtVAePo9A=
X-Received: by 2002:a05:6808:244e:b0:574:6f37:671d with SMTP id 5614622812f47-57a056c81c5mr4578880b6e.5.1795192470491;
        Fri, 20 Nov 2026 08:34:30 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm2517054b6e.16.2026.11.20.08.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:34:29 -0800 (PST)
Message-ID: <0460f99b-ab87-46f3-ba58-2daba2e821db@kernel.dk>
Date: Fri, 20 Nov 2026 09:34:28 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/2] io_uring: add IORING_OP_UTIMENSAT
To: Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?M=C3=A9ven_Car?=
 <meven29@gmail.com>
Cc: io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 =?UTF-8?Q?M=C3=A9ven_Car?= <meven@kde.org>
References: <20261114104621.1186744-1-meven29@gmail.com>
 <20261120-vorfeld-formlos-nahbereich-00aebc4c5150@brauner>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261120-vorfeld-formlos-nahbereich-00aebc4c5150@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 3:33 AM, Christian Brauner wrote:
> On Sat, Nov 14, 2026 at 11:46:19AM +0100, M?ven Car wrote:
>> IORING_OP_FCHMOD was proposed in 2024 [1] and not merged. The same
>> questions apply to fchmod and fchown, which a copy also needs, and a
>> single setattr opcode could set the mode, owner and times in one
>> ->setattr() call. I started with the times because a copy always sets
>> them.
> 
> To me it seems strange to grow an io_uring opcode per attribute. What
> makes the most sense to me is a common interface to set multiple
> attributes in one shot that is shared between io_uring and the regular
> system call path. IOW, an extensible struct based system call that takes
> the mode, owner and times and does a single ->setattr() and an io_uring
> opcode that uses the same struct. Then a copy sets everything at once
> and userspace that doesn't use io_uring gets the same thing and it would
> reduce the number of system calls for userspace and less work for
> io_uring as well.
> 
> The other thing that this would allow is for filesystems to implement
> multi-attribute changes in one transaction.

Arrays of things is usually unhandy for io_uring, eg if the idea is to
have an array of structs to deal with. It's a lot more expensive for
persisting the data, as you know need to copy a bunch of it, rather than
just have the single item which will fit in the per-sqe data for
io_uring and not require any allocations. An example are things like
sendmmsg - that kind of construct just doesn't make sense for io_uring,
as you could've just done N SQEs instead.

It also becomes problematic with the non-blocking aspect to deal with
multiples at the time, dealing with "yep first N worked, N+1 would've
blocked" which then turns into do you blocking retry the latter bits, or
do you just return N done and let the app deal with it.

With that said, I need to actually set some time aside to look at this
patchset and render an informed opinion :-)

-- 
Jens Axboe
