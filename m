Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288045;
	b=2Izy/wv/qJjUqz8XbTAM4X/8+HQDy4gRs4hiNvkH4t8+P9oC99xAFkKnEirSd9PLT8Cp
	 FJjIFvh07pku0x90isrzzuEVSUVOSYHBoY/tcLRoP9ioYqOHW+Nq1nLuf6Xu/ttj92USm
	 CTpXg2QUmWtzl6obo2Ppz3A6sejtb0mkRN9hQouo1uQU4nJ10FfiVwcKom8G7W0UaLL3Y
	 xuitlMZdQDNVFZPrl7MjUOBwmsnxEj/bogSc+q+VlVtpcd6R0D0KO2OouesG3rSkGBxlh
	 Fxh7s9jasGRKkvVYqxBS1XFVkHCZJhFWtWrZVEyTFHm69i3qhWFMRrddW6czJtaYKiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=4NTO547gTwHHuMKJAO18fdInJ9oPhMMyVlUyKNBEoeg=;
	b=oClsaJzSEbjWphNWbXiRXkm6MHTCpI136NZ/iqnVnY0WnnBIDE3vLtaCwm1a25V4mlu0
	 Lx6FYDa8YtDWQe8dbOfcILO6st0vLIdzZjqjsOGs4HxcPZu8xXLlFzplNtZO1GclOWNef
	 yeaujz/tjdllmW4yvjDbi40kbYss4NraGBK4DahyvensCWxoKKJQBBnVnSMpAdPPRqlbf
	 iyMfEervsbe22Ar2+BSd30mVkgz3cXtN4jHMFQ8tbqJyzPdcQIH0bKNfqeznhK5H98xLU
	 uddE+w1sW9fkBETgmWum2vXYCJJa1GAS1SyxYJmLkwx0oW7DG8eiKqt0oQ/uI54+vIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6g39kT1;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD29606A31D
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 15:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD29606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6g39kT1
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso1040752eaf.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793288043; x=1793892843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NTO547gTwHHuMKJAO18fdInJ9oPhMMyVlUyKNBEoeg=;
        b=p6g39kT138Y24gIRJ1SqOsW+pHhTeQYiK15FtY3ein/4TaMIFGT+T6mcf2yX9caLGB
         NI3thZSratt12xkAc1LQbvG9dzf/p3JrfaxBnbo96W1Gui5rzw8oKzXYPqLxd/JZ8gTn
         Mk8Dl4WhtGmCUDakIFoDtJ+M9Ad5thTPxgUI5HMJUPqfXbe2UABgaV/jixVGYP0vMi5/
         SxgOocFRD7iNk7Ow3lv7n9Q0rPKASvv+doDmeT6VbmNc7EG12ugxk6p6hAHDnCzARU4b
         JuRxtOZH6yA25oJQ+XClGZCp5cWESbwILT8solc/l3nENs1hcNB/L/0rtBS/Jtsp1BwU
         o8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288043; x=1793892843;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NTO547gTwHHuMKJAO18fdInJ9oPhMMyVlUyKNBEoeg=;
        b=CG0cVxllZxRZbz76YiJwbfnW2rwltz3hlfW5B9c7oSGimwSB9WaqS6FaPbzn9lVpGU
         nYph9d281+e0LQILGjbTSgPSUbiSR+mBc61LkRz3cL6rnU3bVASpceEPmPMMJ5R+H0wH
         zQ2OlnOKD0pT/nSWIUKlzNpxT0g7yMIfrVdXluh/c+qd9tXXrU36psEN/tvSWajif7aE
         c2oYnTv3pM3mXfBwIcNwm/9BHdkKqQnvY0sW2z++EkYCU2afOK4W2kP5EttQXejB1cAD
         diqq/N3n3V/aTi8bVXAdlGQ+YTBZeLYxtqO2BC4zFCJ8Ha0iEve7/smEBMmDE09IXadU
         ME/A==
X-Forwarded-Encrypted: i=1; AKwUvBx0fxsQjWREzwWvx6NMRSy7t1/umW0tfsIGA8boE8YhG/UinGFSk4yoSgf1l5qToQ2MCZqPxh1rMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJq2+zpNNwzNNrywnq32lBgMyA53XmEOuU7eBFqhHdJJ1UuJ5y7
	fYMZQ7BnoCu0EmSnEJ5MgSY6/WREKWiZXwWap2G1BqKI5KrpCBv8n2eBvJJVKJFrJDw=
X-Gm-Gg: AYBFou0YljlgYJ9iGREI5JszSMO0wfrLNPBqS+/E+fU7mzvidyPhr2xluyXCERxwStd
	Bq7KVdHUjkkevDFnCfGB3lOdprWPrvhSDT8f4HJJ4UkMSFgPMft6QdCcrNyOy12c2G6g9zcWXuD
	3Dwievw9nDC2OOo+lR0p46OlvzT2pY9ZRohp98LPCR4Yqk+j40uoy9Rft8T/2tNUxlXTPUvmixb
	YkmjLGpIDY1oavBiFOWI7aj6cwipPNehwoTBQD6cmIQIb8f0HS83HSKSAvNIruAScc7xCIq9T5O
	I5CS04XPZSf/9g/0uy68vyN9+Ny1RJrNiEU7DYwXJ6FpKWn8dGHufnAVdy82f/VrolQtnMicXDm
	ojxu0nrIf85dvnvXzvb9BNwWWamAURbQOiutQnT9/JaFPG1ULB1dAXjcNDstbGQBvidz+3IDMYQ
	0NlGtzaelMK+Wsd7zpsN5vdxfmUJnV8ua3yRMMuluOCPkjSCL9u8veQTGuaQ/Y/WULC60kte4qM
	A1U8Qj7t399qD/y01OHTEX31ipcclzGr8/20+mfPG1hROwYpXmvQrxpTG5A+fIgXo31wx8sd+Ry
	/TH0CwxWA0B1oWlMvBxVP8oYk6YkpiCfRk8mMX7fOvq/KKDf4yZKJIf6ZLFU464POY7mvPVoIH+
	2rCq5DKJMJzC4BTBe1AqJdgV/eRT0QSk=
X-Received: by 2002:a05:6820:3395:20b0:713:da3b:8fdc with SMTP id 006d021491bc7-713ef14200cmr2273261eaf.32.1793288043291;
        Thu, 29 Oct 2026 08:34:03 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d34008552sm77736a34.20.2026.10.29.08.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:34:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Anvik Loitongbam <permissiontogallop@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Olivier Langlois <olivier@trillion01.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261029144745.23792-1-permissiontogallop@gmail.com>
References: <20261029144745.23792-1-permissiontogallop@gmail.com>
Subject: Re: [PATCH v2] io_uring/napi: clean up list traversal with
 list_for_each_entry_safe()
Message-Id: <179328804229.1479009.9159833350828920392.b4-ty@b4>
Date: Thu, 29 Oct 2026 09:34:02 -0600
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


On Thu, 29 Oct 2026 20:17:45 +0530, Anvik Loitongbam wrote:
> Switch both loops to the standard list_for_each_entry_safe() pattern and
> remove the explanatory comment.

Applied, thanks!

[1/1] io_uring/napi: clean up list traversal with list_for_each_entry_safe()
      commit: e18504a4d378b4c9e1ee522ae7fc18cac8b1fc82

Best regards,
-- 
Jens Axboe



