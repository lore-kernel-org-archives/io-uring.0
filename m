Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206056;
	b=5PLdSo64zeg55qzOMWdb1eTmoylCxX+QVjt7M4vh95w8bxlCRijX0ZbYybMclQrfsgUk
	 6qStrx6aGaeBn/idAi+9CmoXLCjACXCmJbMx8zOVt55RbEDu+sWDFPcacKumx4Ze+OCRr
	 ILT04i+dE4Sves3B8dvggrLlRwWxWOE7j/Ybb/9CLwtF/tmqfxrpHTvLdYaLcpC/qtH9D
	 7C+m62gRLbARuMHVj92eVw9jMV/hLRHmhu43QCBJkm0efkMttSfwq9OHTooql8TIWbPMn
	 qys8jNrFiTaMA6S77ZMAFK2ElGPfHXrt+P+lUeIGiX7ylpnan+jE6fn5PVjmHW6R6tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GMvP5ySehrYpY2Ee0V0N3MZhwfJEHtIAXGyaPX1+vOo=;
	b=U7zSWMn8KAOgJ215mvuvDI46EzPBezumDuGg89TaK53818GmM6kyEGkLwz8Sv0qB713q
	 Xy6d4Xxgo0J1WNy93CBXFIW65uuu4Q6BUwQWR4S+APcNa7bK94HFSXv/+kotrEquFmTpq
	 dUZRESCH9ThFduhVutTmfyOn+aCVt/WrmAO0p8N/NJDdljd16kzD0nb4mfe/1cAJnncTM
	 SkEROMfZrBqE6heeR4xuvQwyZHUBI9aAW9tsszWTfAsoluUFmD2wGT0gtrgGjinXBlbeG
	 Wwy7YykN5jFaFu2SnlnQoczGEUzeQe4lbWTDDczGL18MzeUg+KDNNgAgWPE5NwUzz4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Obi/7exw";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECFE606A31E
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Obi/7exw
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-83bbcfba0ffso912532a34.0
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206055; x=1793810855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMvP5ySehrYpY2Ee0V0N3MZhwfJEHtIAXGyaPX1+vOo=;
        b=Obi/7exwG/Fw1WKMjGKfPIZWRReya6s9aWWuyKhHFPhkrqIY/yBjgv+gqE6E912apP
         cB56LhkgRRQQF8pNII9tJMUVsK1Jv5N1jp4OiQeFBEX3r5RGao+yxxNyEzlXgXC9TRiE
         yGPIny3mSF8wO2Pw7wIaVTNgEjP4ODCNSM9sbhKK+X9DpWDVS509krw+/G3dUWdFg1zt
         Ng5V7aSdek45Gr1ofWbh8F8d1E5otyv5TsJj+0+k8n8VYrlmjd0KNJuCbIBjU5Jbqk3F
         6jliyDQhzBO8heP/xpBY1ZW7V7ISEypOcx7auHjrf9Tcx3FCuA57C7Nc4D8q3R2gFEs1
         Te9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206055; x=1793810855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GMvP5ySehrYpY2Ee0V0N3MZhwfJEHtIAXGyaPX1+vOo=;
        b=cNkxplE5Rd97MzbC8Ky3LMmufukX1+y6O5LnnlZzaOD2FgeEAc0FOz4ztNVIMyOBHf
         p1Fn0jvwGoWCqKo6XKVtxTveoY+l9QcmnxiZEn+axdspT/ZUgtbRuVC4YjXYUrda0GzW
         4lE/z8EZKpGmNLxKtU7mZdZVBXIvGj8HmYK1PFgAy/alLq4aZDyHRTNyomFWeq8aXGmH
         Y1WTWIsvwD1bWPXQFySKsKpmkuVHrCsj8aULw04mAaCPSmcXGPKW6YQaSoqx5B7pwwpC
         K/mNlQksDDq/sH0nNM/i1+2vd8uRT1rlZvBMCZGzJEY+5m8rK+ZgPKrjC5psXzepqUAR
         z3qA==
X-Gm-Message-State: AFq9FYIBrk0TQwicd3meJyrFMCPsFd+E5e6mIMB0cavIwIsgzddEYgEW
	e3IrYDDARy/ND2NXauGynUzVjzfiX3U6p4Np85M60N1rOkYCqjTtYL8P6NS2eUiTaixWII4zBg/
	BEEWQ4vo=
X-Gm-Gg: AYBFou3FixMyquTwpVtyD7D4z7zdmpNjzwML+TH7VyMVzfCzo5QYLkU+dCYaGwEIqJb
	SwpDgPBBPacril1qpjgdDLp/DcINGj/nwlSA72IqrvtQMGmg+Jt7NGdef/jBLVtgLyuz8WQcyQo
	ciRFjOhjdJszWnVeEpY03fRs19gtIdoyFU3bp14ftt8pPQGD9hrGwVrPb66Jy2BWT5HINbt6wan
	yHLb1+xDxYHRuVaewkSoIcNr+GeIKkphE6KGZKQ4EUtVVhUnWHHr1KmK9oeej1J0sDtwiwvOAAe
	RdpAn/ha503bQlvDQBNhMO1lCn47tXt21pu27caobE9+DiOQNymCEkpd8wCIEe6ATIAZqPuG7kK
	Dt2N7fauKnrV6Eedccv4xskMsWsjKU4ewl35xuYxVIZOdtv+RzYCkWvcfTaimtDH75Wc4Rj1gvF
	hQ4jGQDSRpaUsWWcMACGNIl8dljKoKF3Kbixa64p5lsJf0FZFUuUN5vWanFabVUIax+9utCt95e
	U5bVWbx/DnaP9kn5oz70Pn/fGQpCya5NczM+cgrcE/T9gD2Tg96NbwlLoTevZuFSi5c7F+BPOcJ
	fu7RjDBjaqe8hD35Bh2yDV/BBXRQDRtscBgm5PVkmO86fnrQlZdK4jVzRV/vPFatzyyVMZERfg=
	=
X-Received: by 2002:a05:6830:3e03:b0:81c:e3de:d18a with SMTP id 46e09a7af769-85abddfaa0emr2355013a34.20.1793206054933;
        Wed, 28 Oct 2026 09:47:34 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.34
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:34 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Subject: [PATCHSET 0/10] Various io_uring fixes
Date: Wed, 28 Oct 2026 10:46:48 -0600
Message-ID: <20261028164732.1264069-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

No particular topic here, just a bunch of bug fixes. Please take a
look, thanks!

-- 
Jens Axboe

