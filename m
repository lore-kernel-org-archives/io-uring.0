Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727845;
	b=Xix+ZMvyM0ANJoNVfbty0RgWYKTrrAi/L4C0Lu3NJExgNoFEydROqc6mom7EAqLy+4Mx
	 iCam5X9rmOSCVkDlNk9WXubBIAMGDa1zGj2DFxTcT7JmQK5BU0drPBk4yfUk1L21w5Tsx
	 JXmtudzKrPuXf6cUYWf/5oPOmNYovSwgrDf8/vCDdW8qOxDISQIbwanFsVcXWb6gtwxdS
	 CDgzo9/eFRvgkflCxi3xeoemd6q9thYab+cfGDnm8qDFs4obW4U3sP4nAh/TSUbAJLhYc
	 Pw+279uxwyVmVyhSgF6QM5nEkgNndgvh+Yhpar9vlRlIlwcJcLc4hwzMVGpecM2FD4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4On2jbBMJ6X8mnAYVO3IrjGpyK4VD72TPi1ClKlL+fM=;
	b=S2wZgCzgZr8CIRwqc8RqVwDxhFGNv0F62QKw94UpbWtOvbxzbMuU5CD5xHdMd+nuO6yo
	 mr+yNriK7GLEFM8/lDzDdhz36oI2EW3zFSf3hpKe3UtzSzQQ2rpsNGh6ddpuY/lP9dnSx
	 ZZrSTvVYS2WVImFAJqD3cLZf5HLdKkwnF9zGOGZMxA1cagJ/v98RZEMA5EKPcMv/G2Pdn
	 uxdkN8tAZfFDXZvR+cGuDh5ETlJqUMR/olK3CCphBnzcHU1cb7PhxSv0BDBct/0HyhugF
	 kT798tQ8nxH4AEtrXuNG6PENd71kEQlsFwSTW/fWF+tAKOXPwFBp+QpdryYjvJ1QFzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbhvTkil;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C84606A32D
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 17:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C84606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbhvTkil
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214af2076so34369885e9.0
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727844; x=1794332644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4On2jbBMJ6X8mnAYVO3IrjGpyK4VD72TPi1ClKlL+fM=;
        b=XbhvTkil/Nj8Sy/zzFrY9SRNgVSTxATC2KnUUQKFHuo29YQaUITobco7t/VD33yQlc
         OrJNk1PFY8bA1qL+wgck34HH0644KVpwWB0ErQ9RPMkszA0CB7lxdxpzfBoRo3aGMxQK
         iDJeq/Pdp7QRNRuvAniyJdMMLBpC5FSKY8By5FwqQLwiX2g0Hs81KjTHI8/fT/Fbf0c+
         OhQlpkg2kMvfFR1LLTL0NJff+Xeqqiyl0gvgSJ4Poz9oiCIjBkxs2rks58wwaQ2aj4n0
         wA66lUz++goOi16A0A5DiP1LD1fBhjikDOoDecZXND2FBWA5RMPLVWmImPsNJ8Bi/X6n
         EVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727844; x=1794332644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4On2jbBMJ6X8mnAYVO3IrjGpyK4VD72TPi1ClKlL+fM=;
        b=0pHZplzccovozeqeTn4DCcp/UQzSO+IGRpltAvl2zQLQkmiMMF1zbRuuqcfM2qVy7p
         LiVywmnq0e10Ya1ktwUEEE1K0XARawu8ZcSGde74NQSkuGKtKlVBBxraeAQmVsZ5VVAN
         PLnJllshRdHBbr+MKWy7U0TCV0E5I1+S4SYMaUboBD7kU7YhYGH9BYyEnMhzUSBGDvGD
         7rim7tgIEyz5/EEtxStXarj1tISxRCp+H8Ao4UDFHowMqoeOvk2sbFJhgQ9dc8FlFLjU
         magn165aUbu9lRXJraeCMXp8RaYRKM0WQ+DKh/HxGKOD9xLWdpjlNjJPK+bOtjgXUmyR
         Ek5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzV/+xYK+KxyOB3Kop5lYg4VnYv/NBWxSvomrvo/KFDIUOnwN2HmP+LsNg6Xf41EN/cyjk+/fTRJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9tgK21AWUrbcigadTDDy6bK1UfvnBydrQYcVYTaqZAe2MBNY8F
	TBKBuH+eT6QZb8USwJygIIocBdG4IynHJi9G6lqZZB4d1sg4F+m0lHhTnOj9a2zO
X-Gm-Gg: AYBFou2D8NoQ4b3cwBoB4+YR1YZTSo3Ls9fxhSHZKIXiW0+J4er/1bk0EHVujZmKPBq
	qUOXnj3PJb3BfCX9v3/F01ygkbUe8OYSqROvgsIonZ0cAJUr01Kn8TzNelGunpndXEnHXQ9qxNd
	/MU0Qz2Sar+4pUEH1Imu5QNXtNMTe4CL3fVhFCQfmhjoxuGdXhmUJGZVQsKr9s/U+0zkJMBsfJa
	Yvzh0u20OooaZmrMEUi69dW7GP9FUuz4vJEqApECtAdlhUKBKjI3Qm5+gaFz6VdZEpCoBGeNAuR
	EO98eoHK6a4lDLJxMXxP2HCPWhVKALcOco8S4YPu3x2wqgfTL7sEwzT/J/A9ssXQJ4ERYbq1odU
	AZUJTDDclLk36PBy5JUPNWul1/tIDZ+ZaE4ud2pac9rc+rL+KDVze7QsVaOCblvBNMGj3+RDrqZ
	zZIbLY6ms3MDEbr1xYLuhmxKVqxeKexS9g76xHPKthSegoKxB+M6o3zw1p3kN0/Pv74I4/1KMjT
	jXUyeKzTs6KXID7l7XAUE5P+32wg7tYliTAXq57jwlVA4eyVwp51KHiDDM4/1i2Bt4UMMkIScFW
	G5hJB1cn4effT2lmK3DqHdYdEnHsha9zoNqKND41eywn+2hkEqI=
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr318846515e9.32.1793727843751;
        Tue, 03 Nov 2026 09:44:03 -0800 (PST)
Received: from prairie.home ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm262225075e9.2.2026.11.03.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:44:03 -0800 (PST)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Stefan Roesch <shr@devkernel.io>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
Date: Tue,  3 Nov 2026 18:44:01 +0100
Message-ID: <20261103174401.5520-1-notprairie@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027204840.7823-1-notprairie@gmail.com>
References: 
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

On Tue, 27 Oct 2026 21:48:40 +0100, Cinq Prairie wrote:
> With a single registered NAPI, io_napi_blocking_busy_loop() hands
> io_napi_busy_loop_should_end() to napi_busy_loop_rcu() as loop_end and
> runs its own loop once, relying on __napi_busy_loop() to spin until
> that predicate fires.

Ping. v2 follows the approach you suggested in the v1 thread (absolute
deadline, fast path kept).
