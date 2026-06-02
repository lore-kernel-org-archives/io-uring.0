Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C33537F9
	for <io-uring@vger.kernel.org>; Tue,  2 Jun 2026 23:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780443857; cv=none; b=XRTxVLzDiPREf2aHbfUX/TeFBeR22RuC+oIHNerFn1lgzuR+pvBxcxSuAMuuBOlNxtnYKxW026r+7rFOyO1TfROLWli+nCKX/VGm5lkbVumRQ0/5ScY5Bo8oe4GCbbNmrgO9gRPQyUWM9RlVSRh2meAt0EQuSPo/5ciYWuMK9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780443857; c=relaxed/simple;
	bh=N63Ul/iXiZ/39XXe/JWNB5Zm+wxegP+WVgH8rtRwJn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UfFoTxKe8r1z2krFcjWbmLjYm6trub9sUt/xYyLHUlkM6ucT4Gd4NJd0b3HCZEyar0c2DKU+yz6f+uQHW1LWgzZG0by35N0OyTky/yFFh0bRS87DLDLnOQl40P93xtcCQNPOeeuq/uUUfYOKKIV0RU0Qyx8KBjCvnfxecEO86/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=GHcmWgBn; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="GHcmWgBn"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-69e1eb34b20so1367334eaf.3
        for <io-uring@vger.kernel.org>; Tue, 02 Jun 2026 16:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1780443854; x=1781048654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2dCQPDwRZfqOzEwEr+a/wFEDPQF6cz75+IwDZ2k5qo=;
        b=GHcmWgBn516OG7XOR/sEdvrW/BLL3E05fNAZ3aZ4fPxX8V7B5bQ3WxhhYLlkCOdEnG
         RSPnsJSfJaZD+7HpwaOQ9W82xYqS0hJlOxlQnXD/8FX5OLNy0fvxCdZcXdf5etWaLb1t
         BOBC00QDG1TKa6FsTwVZhr+03paxWSs59qpW6CjkXryiTTMblWijBv/DhWYlVpljxJHx
         D9TdrmkK85Di3bcE3ZuCPdLUc50DG7cAachYNWVgaajDqVrS4d3IdS2FlImiNrMLlC7b
         ku1gCoCbj62ppFiyyez2TZZmGKtOVy2MCKtUdxmewcUpFt7mk/CwiCrardST4PnwjE1y
         m1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780443854; x=1781048654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2dCQPDwRZfqOzEwEr+a/wFEDPQF6cz75+IwDZ2k5qo=;
        b=eB3MJ0s7kh6xWsrhUI/XBaSzwg6o9msGWMPZW/nN7fMwVqmTYTBg/qBRBd4+sKa6ug
         3jCzdHt5lkWP7RzsOOqI0I1e+P7hSwljlOxKtDlabdFd08yfjYuxdYS+Wmo099vcqgTx
         4Tjiac8+fuV2I85pY/eCS2UbE2pOrqzx883qq4CkEyw6KCKBlJ41WHoEL4NWDsDcdRwj
         Cdn3JC2+2RMYoqVl+1k2dGVdcjhc1+L6tz0pPRaUPu43vE2kPaO99lusJZHPt35G4euO
         vbOAiARNpbZ6SY8mjbRvdMq77NyVs0ln6vIq4WbVKRbiGCCu4LzaPli9GAJiimnmMGFk
         +kyg==
X-Gm-Message-State: AOJu0Yx1aDGVFrU4Fq1fIFh7eIQu7c3Byv33SX5IoE/nV0SaK1WUJemL
	LimEmyjlwuFxH244HY2OYg/g0hr2+YxOP9sX96I82C4QskEJW5vCDoGQAlN370xcWknIvD1wCf1
	9LeCQ
X-Gm-Gg: Acq92OE8W5vDAVJe6j21/LEeanVqXAo9pWLvU+q6K9GKpxHZIV86UajSw5Ri7WrXCYp
	b/IW9pvyyfGo6Ptdr8b9/AydfRFrzwIi0u4TBaE419/pk4XVQbNQdk2yFegOfOFKWEDXXq+a2RJ
	ZikrPsuevt3GxLcdsRPRUcsUTPpDK7ZCktSVSlo93r99mCSUd6ayZ6YK3In7OdzkMAOgkTI0S/N
	RFxGq5JJsulK0LylCngLmTtJFBK2bdW0m/FAwO7qWaD5NR/3hsrp8jVBOdhhSEgzzQeJXDev4v9
	Bekc3NSQd0XXqPJQ09Dz280QEC5XW0NdTofXYVasDyJxHwXTlld+IwCtvwxMmWVePADN7OctN/k
	gYe4qoa/TYK4/Gi3M5CGM1r9y4SpqnupH0xdTRjmwJp7RmMyXEPa2T7f4mzAk8ZVublNtnv+jSf
	/AtaYNoK2N5BYgP/yOwcoyDLNMFCj+u8jStj3z0FIJU+jFRMcRsJR7awYw1K8gIsJbiwkNErJyN
	6GEMLfDX4Yh4+g=
X-Received: by 2002:a05:6820:212:b0:69e:3c79:6e7c with SMTP id 006d021491bc7-69e480a6ef4mr750497eaf.46.1780443854071;
        Tue, 02 Jun 2026 16:44:14 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e4620b0casm827919eaf.3.2026.06.02.16.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:44:13 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20260602215327.1885109-1-krisman@suse.de>
References: <20260602215327.1885109-1-krisman@suse.de>
Subject: Re: [PATCH v2 0/3] trivial cleanups to net operations
Message-Id: <178044385345.624863.12154869858614804502.b4-ty@b4>
Date: Tue, 02 Jun 2026 17:44:13 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 02 Jun 2026 17:53:23 -0400, Gabriel Krisman Bertazi wrote:
> v2 only touches patch 1 to apply the changes requested by Jens.  More
> information on the changelog.
> 
> Gabriel Krisman Bertazi (3):
>   io_uring/net: Avoid msghdr on op_connect/op_bind async data
>   io_uring/net: Remove async_size for OP_LISTEN
>   io_uring: Drop wrong comment in OP_NOP
> 
> [...]

Applied, thanks!

[1/3] io_uring/net: Avoid msghdr on op_connect/op_bind async data
      (no commit info)
[2/3] io_uring/net: Remove async_size for OP_LISTEN
      (no commit info)
[3/3] io_uring: Drop wrong comment in OP_NOP
      (no commit info)

Best regards,
-- 
Jens Axboe



