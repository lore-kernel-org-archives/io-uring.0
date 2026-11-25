Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632403;
	b=KF+7H8Zp/A9PAfVQsWZ01nyTNFQbv4y+QwZxIoJshy1LZdlPRyNe4r48hmtWqAXgujdr
	 xEsKrx/uU2gv0aXtGTOlLXQudY7whxeQbbZ/FRN88ebBZETHapIwR9KQDoH2G84ktQaPh
	 W6OAm/CnODsmsKvTClgeROpD1LDIQ2wxBLUpIe3Blbd+94d33WNHGBYiW/GzlWo+Xnf64
	 cI7PcQNGzMnoleNZ6L+5Vkp7ik03GjRs8ardfohMe10HEf9DG7sZVQqY+z9SafaZpAWxQ
	 M55lUyuv5mrorZeDDbOPtvQk77dGwzLzZzjrXZQGjk6hJd2TIpTyRnMvPKcoQOHM42g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mjng7Grfi+u3FVsnhecehgfZVWYTQAiCxYEYWdDHAjg=;
	b=siRb893MaBuTFTESyVcAsuNe3Qb3dugsMqVjgB3XcUE4CGQf8Yl7GYxwAT81G8Bw6pOi
	 TMFSjaKDI7GmP0k/juzFDL9tU1gj+UvE4vXveIONNzlBxM+F0GZcUjYuCcFUamCXGiQXV
	 17dtFGzN4y+O7c0v5z+tNHde1RHl7Ej6qyF3dC2DSKmTP8x2Ev1haOC/KNdMeTi4+F+5Z
	 J+K/hHXGbICh6TX9q0GJ1PztqyZqbceT0M2i4+LMUYpNZ/BHlmmVVeR35o2uLnA8648Xc
	 8LhQlcUGCFvOdwEz8WnURGuQhjGLkuk7FoinXjbWKZlHHm8YM1sgAS12e5kKYNoZG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=FCVWvL3A;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE2B606A323
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE2B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=FCVWvL3A
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-483c607ccb4so3188179fac.0
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632402; x=1796237202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjng7Grfi+u3FVsnhecehgfZVWYTQAiCxYEYWdDHAjg=;
        b=FCVWvL3A9pPajRsorw5xKgFeZtg8bNqB9d5z48BRmkv/RN0ksV7mW8feJ1FdHXkX7D
         M5MhCMa6fP8Jo/YZIxdt3QdFhae3xdx70I2xdYN3OcrY7j8Vex1PQlRxc5WuFNxckaRY
         sgJQGpIJ6gc3jCCPLiRW70LNGrZW2+wfGQb4P+Gh0kXnCng4AP9SSLgQlCk5CdpJ+6Mg
         9ZeyYGwMPMtfJy7L3vA7kf2Lh/3D+XQXq5YvwgfaCXThcgJSor1qc8v4bVjNJq/CugrF
         1gIA5oqKYDMc3d2PPtJvFVXJPWM9FFpPZEHjxawHbALUzFf4qVIWEEWsI1OLfhH8kg+s
         lzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632402; x=1796237202;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjng7Grfi+u3FVsnhecehgfZVWYTQAiCxYEYWdDHAjg=;
        b=AEsDg0jCmcBnoLEEg2hxFRr2WZagzQlDdWn34HQouop39kovKVw1z9t/5AoB2mIGe7
         anbHiMSRjB9JOtnW5Rd3p+8y98a76zm/OK5NaZBfLuxBvalnoEgaUTSa6JdB3fg8mPES
         sZo3VegG/SMcRis+xDvRuBLr466b9J1UXTfzRY2rf64jqzv4MViCbnzb5zOIplJuP+TO
         17FKOSLKS8SU6YSazaa8kLGbosGLSEskj9J8Ff3Xa9QThSCCkZKVQOHj6KGdTF/8hb8j
         Sn3+y+t0b0DmvE8Xnke9c6qaAkHa8b7MZFh7XZV3IuO1zv/wyDf259hI7s8tDs1sTxfp
         hdkA==
X-Forwarded-Encrypted: i=1; AL+hErFSzu2UFcECQDEKNhXYkHZpRyCgKEI38g3qPQyWkJTIN6/tVGD9oP0seZ/v9aQvYmQARjOGZEFRoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9VcS/hVllxttSopvPeNms+V3v8M+9UKryoW+c90Ml5ES5ygTa+
	mG14g8KzDP3dP9hh5D8Dx5yOB/GblU6SypRMQhS/8Cw8OrnOP1D5+tpsE/TqzmRI8cLroCZOXwq
	xYsxrlBc=
X-Gm-Gg: AZFdTZcA8m8BJyClR3+h5YCz+EcwRK+XJmdEJ2aj0VLDBWxqa3De8WNPibOzaz1rhHG
	LSXce3XFwKK2RsicMNDvY/1E/exjQYQaMKH9mNBL4DI3PCIDX+zvlOFuGRkEhtAFH/+F3Y7VAzN
	9eXcVyrbYh4c9qtfY66Ipxd2UADrt1Jks1F1h4fqCANYWKjZccpJoJyMld70yQ3TW7A+t6OJNdS
	GzxzzUZm8bkSg5YriehuAjrgYkG0vy5iEQvYMzmqKXDucFdHcg9q23BoYwjQ2058il55j+76uR3
	Xyk5Rse78VlooL5NTwTsMOm27TGZOFYFphKtr17ovoph22/0AvpT8A4OhHu8upXHDL5QOiDc8ef
	Z94V2iatpm26zVlZi/wx9/hjiv5jtXcRVBgUUGxWZ06GefZvClNDUooSFMxi0nGcU4ioqJHpSeG
	XeDj5h04W8ColWQZ1KoVsO/MxuMYcyjWURviUVF0jiTvxhc3wZBdqWjTWXysYJ2b/L1hWF3Kvjz
	wng0pk6KSmYHWj36slNqNArODhgjEQr7Eb0f3sFm/+PYoYRlS1RtdK+9vA4bxuwoL87Qk3v4pcb
	l2ogQgu/V8kXUIA9kilBw+ai66KBG5JWbqVchHqJhkiPZlFr1JT+CebYfbVQAy/fGW66gmpu6Dr
	wc++Rx0khEk8xXm+YX7xeVQM5ybs6d2C/jKS+xW3Lx/RhmsM=
X-Received: by 2002:a05:6870:9f06:b0:447:a816:9328 with SMTP id 586e51a60fabf-4bc7d27004dmr15233245fac.6.1795632402212;
        Wed, 25 Nov 2026 10:46:42 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdbb4fsm16100211fac.5.2026.11.25.10.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:46:41 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, 
 Christian Brauner <brauner@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, 
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261125180817.3682397-1-hengyul@cs.unc.edu>
References: <20261125180817.3682397-1-hengyul@cs.unc.edu>
Subject: Re: [PATCH] io_uring/openclose: allow an empty path with
 O_EMPTYPATH
Message-Id: <179563239982.59738.3885070855102608736.b4-ty@b4>
Date: Wed, 25 Nov 2026 11:46:39 -0700
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


On Wed, 25 Nov 2026 13:08:17 -0500, Hengyu Liang wrote:
> Commit 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
> made build_open_flags() accept O_EMPTYPATH and turn it into
> LOOKUP_EMPTY, so that openat(fd, "", O_EMPTYPATH) reopens the file
> behind fd.
> 
> However, io_uring also uses build_open_flags(), but __io_openat_prep()
> still copies the name with delayed_getname(), which rejects an empty
> name with -ENOENT. As of now, IORING_OP_OPENAT and IORING_OP_OPENAT2
> accept O_EMPTYPATH, but fail on the empty path this flag is meant for.
> 
> [...]

Applied, thanks!

[1/1] io_uring/openclose: allow an empty path with O_EMPTYPATH
      commit: 15ca993634424898cc0c055ef84dfbe29ae0370c

Best regards,
-- 
Jens Axboe



