Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF47448BA6
	for <io-uring@vger.kernel.org>; Tue,  4 Aug 2026 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848447; cv=none; b=IGVBWpvAq60hJQfiV2Y7e8QqAOBB/aodPiyZIxGVHEKGDXtn4+B2fH67yLmNjDtM6cEs54BdhqrrcOuH5emUZby/mIcD7TIJarsOkxRqNWuoQd3NrZe9fllfL2KeLji6cdFF0QqDb2lLB0QZHKbDHPtGKUDkMb9ipJ+BvkhkacU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848447; c=relaxed/simple;
	bh=Jf/ulHB64njn4WmjKBUzNqvAIC1wFOlc2MREPr/01m8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SUc85ZbiPQK7SM8fvZOusFv0w0T4Fz9MZGRu/IvePAq7KPr4IcbkYHWXgmyFnoWkmOMaJJtCwIvQtmQ6DKr0BS/CWHJRzIy6X0gWuh3Dqty5L/8vu+476Haap/2x0uoUYSYe/TK/+q2VDHv4QdLenHUisGUNbrnrwEmMJL4/11g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=U3K7XnS5; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="U3K7XnS5"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6acb63301acso693142eaf.0
        for <io-uring@vger.kernel.org>; Tue, 04 Aug 2026 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785848444; x=1786453244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CD2iqK/EPaClCBXLVXSOQDWirgcUGjlrzZ6ba7dIsAs=;
        b=U3K7XnS5EJ+no7sDu2a42bUw0ACXEbrTji+Dv6eml/7SRTrgdzZAC7pbaUgUOLR3fP
         p6Inr6QZ3HIkhwyAaS91TTsJquOZhWewDh8m/EYt0fWRrXyNW8DHocr0XDNBJp+8ljvD
         m1AJa/2b0X6g6TjgtmpPOctCacwDrQyKUEGsa2cogSDkO7z1hKPmDUN5/OryZdzBp84s
         wnLNjQcjhspxtpOqWiirUzk7wZ4360hW8T8Rri08wWJjwdcsTVRX1/TFJuccdK9sGTIT
         cWp8MBTADuRBi9Ua8052pp6ta2KsCGie/WCHYjeylguXKbd+XyocaRfXt7PT2j/htljS
         Aarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848444; x=1786453244;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CD2iqK/EPaClCBXLVXSOQDWirgcUGjlrzZ6ba7dIsAs=;
        b=Nd/hXJF22ksmwxQH4kf8ISql8+sXsT6IT9wnHDlEsDQCD2b/g2iLXtdSfmo9elS0Bf
         9DSsLw3VYpVe0iVTaJKpRNnzhE7z89XYokKZSzhyf1mCyjj93ZTLaktsMfFynbY3YDyW
         K6H4fhyRgCNJYevppYwkBB6B65p0w3B23elAYj+y4m3B9Q0y3xRE7OvCCrlCfmYNPJ+b
         mYOjSn/OcjhOphQpnxu4WnNFWD6Pyor7VzF4HF9o2jpMlcTmREQwrXYXfw/paZysOvwE
         y4Q4JsHPS7lE5ynHFb60TktWizhAh1at7/IqSI8scm0KqMuSEH4lgIsDaN9/SZkFEv6e
         y34w==
X-Forwarded-Encrypted: i=1; AHgh+RqQKOIlBtcl/lJs5x7ZoSPVawUO6AsWxKwX0PpgSndMJuFIR3QyGR7SqxvBj2zJsfEntJ9CTgjkkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2xaZogfBkSJ6R+2VhNy2B6uCwZn5IIuOyDRGk7eehf5cK5cpJ
	7s9yul2H+Fixw0RKG+sx/GMTb/lr4Uaymgf2RHFB1rjmZAMzg7R4fjhqOG1o55y2y5E=
X-Gm-Gg: AR+sD132KnE7h08cl9CKt/k5nsYZn/dWoHUeS1xdJemVNZ0cZP/qtttrwBO/p4c+KOa
	/WSY9nNyolsVz7fmIyE/dUldyVPKghXbHkH+NyIWjN5bks39gvds7MiXj/Qnk5HnrG05HROPfAp
	l2G+y00Nxr3ksmaEwWz6HGImdHPuAnd66H7wOXhEPFwe1tk9WDok46z042b/7qpyN/oVKm+jvfe
	NkwMpAou2xGU2AJqEpR9463btg3Nbu4z296pWEtgaEvckpGahG4k7GvplgCvabv7EASpl8r1MAs
	RDBr/X25oaZ8LMDtIYmuk8807lDQnLgCdWg2qUnFA+v4zqUUI2ISrA/TNs6AHxNI6Hp+iDKsY3B
	ArqQ/tBe/6mSFzhCvNHngsOvjxmVXEorGcKdIPOSMzEwE3OJy/q8/O01+AUdWEr/xDecq2v5ImR
	UqOiYH//w/RKb4puQaGCu4GGgZcmsqxKouQFK0trLOci8U2wP5kEHrsAJ6rdfb3+JvC9klYjobo
	t8QyNijhezLd8msyFXE7m8UCGo7AxUvB1o0GEoYk+jlI9p87GpJ
X-Received: by 2002:a05:6820:4de4:b0:6aa:e7f9:fa68 with SMTP id 006d021491bc7-6ae828b8bfdmr4365672eaf.11.1785848439805;
        Tue, 04 Aug 2026 06:00:39 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae93d61482sm61530eaf.7.2026.08.04.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:00:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-aio@kvack.org, linux-kernel@vger.kernel.org, io-uring@vger.kernel.org, 
 linux-mm@kvack.org, "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
In-Reply-To: <20260804125524.740996-1-hch@lst.de>
References: <20260804125524.740996-1-hch@lst.de>
Subject: Re: [PATCH v2] block: split out a new blk_plug.h header
Message-Id: <178584843869.926496.8137441533296046276.b4-ty@b4>
Date: Tue, 04 Aug 2026 07:00:38 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 04 Aug 2026 05:55:10 -0700, Christoph Hellwig wrote:
> blkdev.h gets included in various places outside the block layer just
> for struct blk_plug and related plugging functions.
> 
> Split blk_plug into a separate helper to reduce the amount of code
> that needs to get rebuilt when blkdev.h changes and to slightly
> reduce compile times.
> 
> [...]

Applied, thanks!

[1/1] block: split out a new blk_plug.h header
      commit: 758b86f7bc8a2582d0783f3535854ea05d3ff97d

Best regards,
-- 
Jens Axboe



