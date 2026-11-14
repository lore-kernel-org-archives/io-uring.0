Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673522;
	b=TvoXl4hucLeFUEit7emiC7yqD/8Ecc+qRKDmeIqrOcdZtBJY2EngG7SZXbzVaQnme23R
	 bZbiZB9tMFdco41PqBOQSvY9nTTJS5GJZnS++eRx2cnyUTTQAslEEzM2Wcnk7GrM6IhFG
	 bCDBmyUrOEu/guwASHNgEhQKdejnxLx8KGc/pMw8Tba72A2+j7jsgxA9EeGLKdFSIrNSP
	 rzqe4eigRvp94I0QZW5BDkJo19OkKX1/VNp/nzp3TrPv5r8DuXuijZqdJv22RaBkppUDG
	 xrdepv5fsq4/see1Y6EWsdigKeftlFB2ymnrSMAwbzyLo8txLv63nmlfaR+ZLawRmeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=UsPTH/JNuBmWVmvOawz6Z/WgtdRQegWP95I98C9gs0Y=;
	b=LhrzE9ga5k/KCT7UH4RB8yb1x1dSiFkZonCzOQLmRLHyYdYKQl2ihOXmREr41+BnjBcX
	 Ft9HycjrUEez6RjIxoMKQFMxloVNk2cBfVvOcq9upMAhueynFv/1SYkzfjK011x87Yjrd
	 htntSRWUZmYKtqHjQB4YHym6dV2lblLbkL7dHJHrG9ADKUu753S38HynJ09CgWbKhP5S2
	 mJuK989hlbb2nxMe6/UnXKBP1ctGhZRDyuDXoV3lO7ix9BPizsIImEWbX8oCbTVgo8Cen
	 /L9X6o+LC/bZElEnALnM5gNGqqyVV4Q4Pxb7PqPBU6LqEPEfxvSpeZgK9n6N1q6DGmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="PwVM/ZmF";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2C606A329
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 16:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF2C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PwVM/ZmF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so6004377eec.0
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 08:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794673521; x=1795278321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsPTH/JNuBmWVmvOawz6Z/WgtdRQegWP95I98C9gs0Y=;
        b=PwVM/ZmFnVtP9zdB1YcAHfKBcYb3kFZhZ4i9ymKu0Mvfqv0J42O8Hnhr7PZSuD7xhc
         aPYG7gsN4xAeRljBlYQA7g3chXBPnAdsBLT/77GBp31MuzbpvpcwvezGGrEK1IzclQBX
         GWWnfF5GR0qOJpJoJ3umKxF5QDoUQkc00ImFIZ7oKC1zG4NVVXlI29c/sKgcScYWBkFM
         01PsuRXkRYHpCsngXoQOZwKOzD/QbQYiFWga/eKeCSKnOKTbxuYA2yvMA4eFtXNbaBfO
         G3IaCXrKlRyKWK6Ea7PTvKBmAjRlnVov+ZDZhTxz51OKPPKw36tuqMPX0rw4OgTGBIiU
         gSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673521; x=1795278321;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsPTH/JNuBmWVmvOawz6Z/WgtdRQegWP95I98C9gs0Y=;
        b=w0+YBlAOHP9kwpi3ZrHzT2FaLHdIDaE+O1l+7ruZeqW5oF56M3H+h8vkjpAkekwAmt
         RFOw6Ti/gn7sP3/MQhyeQRF5QprR3E+7IvHl0b1oY2hLDBGtYEKPRBCtsXg5g0o56GQp
         IQMpCkAgWYzd4ZdPRkSedhweX9UnJPWe5b4v5mpLeNzwVIGoqow6WRsMDtrNhaidMSRT
         +Rid92QXNu7a2JoJXsqzsUWhqTjKRh9gYP9aNv7w+I3VKTVJP/oPxlkkEGdPU6dk41TP
         QL8F3mHmzaVZpU6soaRb76YTpvm9unnTV8qQIpCs6W+67peKoI3pzIiIsITVnpMkitRY
         +iOg==
X-Gm-Message-State: APuU4Z8bRhN0QNUWPnuc8lJaq0NNVj8cEEmBvQWdqn2XKHmtnSeiahi/
	+FSHaXhDaW6vPkU1MV4kpC7OccVRfrPxoMMk+9Bbj5eFQugBakr4ohLu/PRAjfmCDzOv5j4qgUR
	ZWyMk5Gg=
X-Gm-Gg: AYBFou3fe9sU3o6RZkUeP4VcnVO2fkGwnnTKtIUmplk1ocrza1HELwwhQvLHyhIlbi3
	118TIX83jwqqFlwGmmYrgFVb1XCDrhd7L4CSNI1NFWCwAPuxcKsp669qcoPrwFoloELCApDmA6R
	YA+NdtCPTsYqOnKgqKd/HpewxJ9ZNL88EwbJyqDSCeISygfKVk3n20KGZ1lyqhn0LH+15ZDMMF6
	d3gaeUr+MXpwzzN6EOBYVQR3vL8cd1EXcDOv7qZ0qHnrLtETRGBsGo7fJrQWAjqSlqPGz8psg7M
	A4KMLIyz3d4ZTaHrmoW3WoCoYlsSus6Ex338DWE1I9rrKWf1mzFYDaHIO2udXQCgSptqoUavV6w
	av6iVJ5ZspdSGtUZdE6zTNs8clUqQMdh/Ka5yzbz2AFfcR+2KmcGQakTRMwVtDy9B/lmu/AT0U9
	5WDtREzO6fbKb91sLxZQoQ31/7iB5c4AJYfYLtbFARg73sTFj6sIISlh0GnTutVXwo9Jj6jCZ8w
	AbuV/kJZUaKjjmbIPEJqurED+XvsUt0TSOjadwFkgshcKhu853w0DZRxeGy2PXxZhSTH4Kz64SO
	0Jt5zkeyuWhUrBxTi6fSZc1rEy3a6fgz7akasLC5LMcDShGr4p/1DvpnE0NRc6uPJvO0p5M4xkx
	E1Y+JcA/KSDT/
X-Received: by 2002:a05:693c:620c:b0:374:e25e:a533 with SMTP id 5a478bee46e88-37967cdd715mr7020183eec.35.1794673521001;
        Sat, 14 Nov 2026 08:25:21 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm17740645eec.3.2026.11.14.08.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:25:20 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20261114041123.109163-1-yangxiuwei@kylinos.cn>
References: <20261114041123.109163-1-yangxiuwei@kylinos.cn>
Subject: Re: [PATCH v2] io_uring: fail soft links on negative IOU_COMPLETE
 results
Message-Id: <179467352023.50902.13425399160055711912.b4-ty@b4>
Date: Sat, 14 Nov 2026 09:25:20 -0700
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


On Sat, 14 Nov 2026 12:11:23 +0800, Yang Xiuwei wrote:
> Handlers such as fsync return IOU_COMPLETE with a negative cqe.res.
> The old io_req_complete() path called req_set_fail() for res < 0.
> After completions moved into the core, that check was dropped,
> so IOSQE_IO_LINK dependents kept running after the head failed.

Applied, thanks!

[1/1] io_uring: fail soft links on negative IOU_COMPLETE results
      commit: 9ed19503a7b34e1ffb2b81236843204c473b0ae0

Best regards,
-- 
Jens Axboe



