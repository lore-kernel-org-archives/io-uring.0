Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8A34AD7C4
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149817; cv=none; b=unSGJZVekqGXZuWGEKWs5cE6DNR2iuZ7hfC3XCjQKvv+xvzD5XE7MEmrJPOPbI3Em1UKXqP9WyLScZDii5G64KhquuWwcVj/L0TPghtAd5SZvdgjx20sV/ZF7sqzWPzSROZbVlCIbvjtV510KUfZb+Y6bDEiunsO+//W/2K7/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149817; c=relaxed/simple;
	bh=+pWWSdWJ0nJQQHR+gl/5aLZbTfbYdj8rxwlw++4qvVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I4ju1SnEd9ULu6MKt27NAUDSEiDYrDuZhyBbdjqmAjZvjv72ean+EgO1Y67oX2WWc/L5ma9hHV3GhXSPEfmx/F2hjUpDdaWFTTaAIfgw8oEWvgzFPnvHydcyZQYsQMYOkUolEtLOa5hV4QpKKdaGuZ7l2rbc/8S8ZpMgEV5Czgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=C0+q3VNE; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="C0+q3VNE"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f64ea07036so1249864a34.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789149813; x=1789754613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLwReMhnSuYHEa7fcY03FMJp5KAOlZLzt3XSIvlT+XU=;
        b=C0+q3VNEx50pvvSyHDK8VItP5JXMqOK1BurLCgwS/SFbvpkwLxJeuvf23dJZ+esI7/
         AEf+LWPnp8222v/4O23bNsulPbTxO91Fmu8r+99Nmhk+D0zR1unZm/2n9WoVDw7DglfR
         KU/bQ/BytgG3s3zDljdVsckIDIg80WbOEq6G1IZ7uYVJWPS3f0qb0/220ka0BN/+R0Ci
         5wrWu5ChVC8uC3BytED5xC4T20HUF5wYFZ2M3J60yr+raOWJ1S5KVsXQKKWlWEgjPGrz
         MwYJnVhSbbrbNCjZursqXQpT/ZfFlI3e7QcN+v7M5Plp7UW/br6bhFAS4KmJcLO7PlJY
         9F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149813; x=1789754613;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLwReMhnSuYHEa7fcY03FMJp5KAOlZLzt3XSIvlT+XU=;
        b=VwO69IPZcBFvyQLPtEwgARUvvWXylK+euhyAv50rLoWBsZIVqyqGNjKDtPeXEDcRKq
         vhZjYmedJNdjFQZrGxO7N9DD8ZtF8EFmM5zBt5uIW/12OZuPZ60euZDQ6Pn4xycK06vG
         CVRPdFreJzWWmc9voaDwRvEaZysY3iMuUtExP2HyAHrPZiUI8EHCaZTbOwnMXhmi9vzK
         S+2VKQo5biM8L4LA1BQseOOs7BlPXug4DsOhJOz6p2cmg8jiv7PWLWmArn2OBYLz0uCx
         /7SS66q9pCVztKRjrRv7Cgtj+UyiEfsLslaL1gBn+4hjOOuO3xri4EEKJwsBo7Bt/AHS
         6H7Q==
X-Gm-Message-State: AFuF++nY1lgHj/m23n3uVtN3UTcvJbvs40NCgE3Bk+J2bZhIwiqzvAAV
	kyWqUnwGbwv0PdKzHkbgEOVrmAi/5wnbKb5h1p1eXRBfimdMMovRsPtlpL+pP3s2TcU=
X-Gm-Gg: AYBFou0wP2DgeD78GC9bQKVMsigPLdJvzF5fY/pz1vMByK93r+MTUavZE8EQqrWlT3F
	IHXfZgilO5fYE3f2yVO3qbmTSwKbuPoH1OSj3n1Wfwq2nTZURim/bCq2a3U+frWHuckQSZi+22w
	yvKHJcID8LrTAASayLlBENG85fGianNGkCD6tjRwwIIodbVtRTA4fRcQANQBC+GdR0oTVoYY5UD
	5q+WvQJxAB8ai10c1zTRZL/87JDin8XxFl/m/UZTCSYuKI39f86gYwbGeLkZfi/O/MqdG0O0fR6
	z5zES8+HeHX3qTQUN0Fx0dB0c+dPz3ZheX8+l157LTYmAE5TKScHgfgcTlGcZGlf+jTLkYS3y+D
	IUMWoboC3/2mpncRyCmzAnibTXz55EFNorZxo/NqRMsU1gGm9r5D6mfiw/Q+Dh+HfEH5iID3+pD
	oKfk6flMTTpE7MwfASXGneZNI5JMGFltqXFzZhIwf9IA34a1iQG8SjKElYU2lDmS9mfSB6vcj3L
	aYTB4/5UlHv0bxM5O1EmvfNo/LiSMIVIzcPHv4srMOX6LX/IRI=
X-Received: by 2002:a05:6830:348e:b0:7f6:6618:e506 with SMTP id 46e09a7af769-803fd562bb4mr5057886a34.14.1789149812732;
        Fri, 11 Sep 2026 11:03:32 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8051005d845sm1090677a34.24.2026.09.11.11.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:03:32 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jann Horn <jannh@google.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org, 
 Gabriel Krisman Bertazi <krisman@suse.de>
In-Reply-To: <20260911-uring-fdinfo-tighten-v2-1-fa24d517035e@google.com>
References: <20260911-uring-fdinfo-tighten-v2-1-fa24d517035e@google.com>
Subject: Re: [PATCH v2] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ
 array slot
Message-Id: <178914981183.662923.3814591941846027409.b4-ty@b4>
Date: Fri, 11 Sep 2026 12:03:31 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 11 Sep 2026 19:56:13 +0200, Jann Horn wrote:
> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
> contain a cqe32 entry. If the CQ tail points at the last CQ array slot and
> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
> the last CQ array slot with a dummy entry and make the tail wrap around.
> 
> However, malicious userspace can directly set IORING_CQE_F_32 on the last
> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
> explicitly ignore the IORING_CQE_F_32 flag in this case.
> 
> [...]

Applied, thanks!

[1/1] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
      commit: ab394388d05977f369e8e8d1beceae47fc3c5e72

Best regards,
-- 
Jens Axboe



