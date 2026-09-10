Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96084A68B7
	for <io-uring@vger.kernel.org>; Thu, 10 Sep 2026 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053533; cv=none; b=s8M6ZWrOhsfSUmxxQ985gAl9tWiaUyoofwRx8o/mnnHeLe7P5fuXBrZ96nDhzcIDASkLwJikS1/+jAlncrwI8Da/eEGUvL6YACzx1FunkIRYGaGaEnY+MKlHgOrMEUwcI7aHSTxU9FQ+qulJ1VX6i1+4mBkmJl12epSCrsg3vm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053533; c=relaxed/simple;
	bh=HIb/06Jk9WjGMhhCovFPC0lXAsOCuv91M0tkoBFaR48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TboNFZIHFRWAGabIzDBr4XYmltWRATLCTaeJF2iMDiiM00cveaofjzGonC2UH8vXOpGT9eVzQCv9XyeUQPZW7iGrZN1VklIhzwUgnPLAc51csGPhrVPkT50YIWAk2pT33FQnAXQX8/9FnNtFJsvaqwBV+EW5c38syD6Il/w3VTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=djj5xuWN; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="djj5xuWN"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37dcfe9b2so1234687b6e.2
        for <io-uring@vger.kernel.org>; Thu, 10 Sep 2026 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789053524; x=1789658324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6uCI0kPj41Ea5xqcJQ70nLd1MG31FKPBm6VZYpP/pU=;
        b=djj5xuWNmgJJEZryajnW6aMCfN4Kh6JNej5P2ffNYImifGCNln5l4nBpxqWyruT2Qo
         Nw8qafhCfxsggD6pmJA9tah5CCCsQH8AEQiPHVbOeitdk3JRVInVkwv858wiMvm3u4X1
         uUtK48Ifr4bfSl4Qs2HGTfghkxRbur+V7nonA8s58IHvSSxFMQ5vHGUCpQU70CitXPC3
         ISfope2Vk/ha7Hd+4kZBg4426c3VSEl9Obj5QTniLPG7lj4AHK681+8oOdFXs4rnvaXU
         MnhQD85Ds4hrWKFgz8uFwUnR3Q1v/kjxSfphXhDlfxRlhiW6Ha5YtnpsNOvBF3VCYLD3
         zp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053524; x=1789658324;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6uCI0kPj41Ea5xqcJQ70nLd1MG31FKPBm6VZYpP/pU=;
        b=qPz1z7/z8CCiSMbrPlDA+m1bno4iV1fAkkosRq/VEE3vTpy7cospjotliRSbCK+OQV
         RrPLhvMapt6aMGHE2ipJ9/3sPuShFWOEqCegj0J6aEASbxzum4Ua3wvlIH0FqHxyBD8B
         7iwh2vehir1Q30jZ61dokCkp2FMl31ZhujN8NmmVZTDxSSv3tzfQP5VeJsD9dbZxzb/1
         bEuyzlGxI6cfsPNta4WkMp+C3FJKsG+TKAYNP3lxL0OPL9Pa0BpvTFZx6Ntvb/kU92jV
         on9ezCfLi3LJJontHCCdlHc7uEQpWRqVhBOkNBc8FE1KmyOlKApxRvb5S4FMhrwZNN73
         XEBQ==
X-Gm-Message-State: AFuF++k4DL+TsZJH6oZezFm+u9kU7dLlv7gFcCjMEyMzRB9W7OWngkrp
	NJNU+9eZvOMLJKiUIFgshkXBiwCENjm55a76y8aHmw/ry0yVRG86uUD2blBIIbbUfxtoFXqAci0
	3q+Px9ps=
X-Gm-Gg: AYBFou3J7D3v0jy4e1Kl5g+rECO2pynys0Kb3a5+LEX8n/dURaBa0GyeaNoLwYoiVC2
	Omj7Zkmf+9i3FkWRu7HlXiMG3ONJdAhiPIEbaRmFY8rdpq52NHhZgDKEtxRircJYWNRY1ydU+9k
	0LVUbM4KxsRNt9+0bHmbnfqZ/RfFRRaTzjBJjSaogWdkCzxU/sWjwFKz9tWfTZp5KAyeCfMGTvl
	NlrWfZhBxkzlt/5qC6PV6BD4/PBFpOpBkE45grIzqrEoEfutmOaWNoSk48V4h1GsPPqY2McSsMF
	Cx0AfW4NtmoCh+OuMF4HXKd/jaudmRdRCglB9aLoTFil3TNrT+9JsAsA29K1zY+58qmBpW0m7sU
	bju7JnuEtKDQAC0ydM513cu7ZvYWgnLSU/g9IlRjQ3/MGIn0J3md933ft1sQ486cJPhpCkpnHJD
	7UGdCFw+lrKRYFr/X9ee4sCFGBNUI0/LFMIK6/Qt5zeaWCjLxJfUBpVKef2VyIjFG8laYTWXW2x
	FQYz7hKEixvMoOyhDAUJMU0vV7+er3xaMN4eTJIjqQ/CoHJhSjD
X-Received: by 2002:a05:6808:5287:b0:4a3:f4b7:cbdf with SMTP id 5614622812f47-4c0252d6ba1mr14278855b6e.15.1789053523873;
        Thu, 10 Sep 2026 08:18:43 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1cf26sm19089338b6e.4.2026.09.10.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:18:43 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20260902230041.1320658-1-krisman@suse.de>
References: <20260902230041.1320658-1-krisman@suse.de>
Subject: Re: [PATCH 0/2] Fix return with MSG_TUNC overtruncating buffers
Message-Id: <178905352269.347131.16818497457647827595.b4-ty@b4>
Date: Thu, 10 Sep 2026 09:18:42 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 02 Sep 2026 20:00:39 -0300, Gabriel Krisman Bertazi wrote:
> Jens,
> 
> This is an attempt to fix the issue reported at [1].  It works by
> splitting the return size (which can be the full size of the packet)
> from the value actually commited in the buffer.  Please, let me know
> your thoughts.  Patch 1 is a small preparation and patch 2 has the fix.
> 
> [...]

Applied, thanks!

[1/2] io_uring/net: let io_recv_buf_select return the length of the buffer region
      (no commit info)
[2/2] io_uring/net: don't overconsume buffers when using MSG_TRUNC
      (no commit info)

Best regards,
-- 
Jens Axboe



