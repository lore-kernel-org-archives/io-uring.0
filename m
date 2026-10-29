Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270467;
	b=Juknblz3Y0X/cqjR+s+MlbmUghfNJoOQzICZ6Z/czBiapAaR1q9qmRDTV+XEvEGhDJsz
	 l/R9Y7XgvTx+6V0tsnlM4ebB62HXvTA7q89s0bVg9yr8qLZnr5yFK/WpdxMqtCA1jdnyK
	 QIsqUM5RPtHuAOuFJpyfioxr+MjobEUxtiNjWrtrB0ZsHkHZGUAOqOuXioo1bcSbOJp6B
	 H4qWILELoNO5idITK/I28162henKcMHJilQCSGH0kl+fHAnyVSKFVzwX+tXmL2tpI8nm0
	 L2B8Yffmf865J3DG0z68C/iEL2P4d4VGwvbN0FwLd5FcUPSYdCKfozGar02utHSuCSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7YTm9ioo95Vo9gklY6fm7lji+ML3t3fOVUT2mwFWX0Q=;
	b=Z6EKOB3fIk2G52ZEJo93IJIzEuB2gMiP2S2UDAVxUfTOXwwacSp3mjLRmoM8+ENJJoIb
	 Z9+DRIDwCcSeHkQXig3CnkFVWl0cou0Ntyff+tbBQVXFAMr1shi/AzzYOLM54QbSZlPuh
	 Ep2bfUciZ1CWWVWI09KlJL+XgYDtFBVVDz/ZEtpZYaGkxhtWul3Y+JeDCXQnxcW9f/HQL
	 YLfvg6L9AIQfSfBuAN/HztoepbxkcKGBOA9LoirXBrTdZNS4IzN8o/LWcRZgwmjeCLeBz
	 VF/4uDMQecw7MiGAblpgV2NRKDB4ki8XVY4Ilsoj0DvJTv3kkO+D0a3KDEpvfs6xOqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJn5KNjy;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DBD606A31C
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 10:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DBD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJn5KNjy
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1444242f8f.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270465; x=1793875265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YTm9ioo95Vo9gklY6fm7lji+ML3t3fOVUT2mwFWX0Q=;
        b=UJn5KNjyiRih8vsvpdukZE44AMO7w6G87LNnlo9RcXudohke/6lP6Vx6FsEuF8CfdX
         ntvOaytd9xjKaBH8BcQtqznorK/8Dj4gofogWRdFY0Y6kqN5wb4sReVwXVRcUtaRaeM4
         v13tb23nuRx7cZMhkkcdnb32kl5+ysAYB3yDC9adOuz/XvvuECl2j2823ZjEaXco4Pqi
         9AwDaNY9MGwgFU3FDmjsnFFyYC2T66OYuhEUJTAUhJNZNwWjD43eFD4iCpKmwS8XSnVk
         uPk4NfOg1eTOY4jERyUEGbBy3dGrpo79fkqIL/LpEQ7wgbp29NoqfoteKdE5I5fLRYkv
         zMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270465; x=1793875265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YTm9ioo95Vo9gklY6fm7lji+ML3t3fOVUT2mwFWX0Q=;
        b=nhkROwV3yNqFb6ky8E6UMQUtkTKWajpJDURvWwSG2PwI6p89ELfdGeIBSyARIY7Iup
         DzZeBgXTB6+WZAfNPKUYgUSZF7JtVtPL1Xwo7sdjBLSTOvCPYEDpjlvQQKaIaJz5vDF9
         X6iYdbabrQn3qto8kh8lreNcmX8VlNMc9Qyf55LIF3+yi35ij/tmEE225Z1M+tX/SpbA
         QyUG7a76naMEe0+faw9Y/FDw0aMqVjTvKfSrHq0NEWciI8ENXtLkHaFZ9kiugJX1ANV8
         QezjjUHDuLcENkLHOgZHjQiAptpy9jItmh5OG+0yMuM5NbU/WX5Sfl639JynlwwsitAn
         v/Qg==
X-Gm-Message-State: AFq9FYLKBue402TlOhfY6mIpOp5x4NVYIMvm4mERBm0WHsly8mKXKTvm
	xe4mNaqPyyBMJ3oMNuuv2FaNJE/St8mP4GffqxcY18D7odqVdustg8IE
X-Gm-Gg: AYBFou06TQApkBTZwxYVzgpH2aa2D2QYHHdGRe2rj8hQlykzBm6SpBfI3UI+ZN21Wxr
	JiN8VYsJBQLMAMIEAZjhjwpndI9T+VMfwUjWhFwjQkaBu6TFEej+f/cdHvdSt3r0yaCyei5JUaL
	Pl6IT9+PwI3KanXpgElQoryg4rMaVZMdmu9YmQnFqQ+n56ZeKQT9Fwby7U2dk3nLQPeDKYxJUKo
	BrGL6adIDTVGWo8aV+PKNZTsTeds1TZBVfHLYFft3hU3lAfl0VX70o09Tn+RPPtRObNJ/wwq6uo
	4n7Gb3cfMNaE+wx+4EZy7bnJTuzYCPepTmgrekEVEAr2eyRht+G37dE/Ehw1zPcbOTWXHlGEv9Z
	XuNjEutOKyGyG/CqxqtUObVKOTSwDmr6eMdrDdou3sYIUk0t3TnAAVJSO9eOnLQ9qV6Yrigoh5b
	ZOfcxtEdFnsolFkuanK0R/KSTBTPd9yK3nUpi3BpbZDIcP9O9V5vgsuC1XK+HhXOVw9UuTUt0di
	fjXb7iLhNgCa23OoHEIQf+w4oLadjvDl439a4W1C+Gzas0ruHIbpd4fx+qJy7lkDsE47JLolVYb
	nki5OwuM5idG8xdXcfYXXlKNgr2d9lw8D7y0bBRH8xyZhTgbB0X2s4qeaDy+0aT1b1ZlGC6pCAv
	SvanwBcrEhQ/m/HybABm/i2z/zaOUNknupxZ8mcjyhVQ5iDchMVx/LsCSMfPqG3gyOgRoku/KNW
	535Q==
X-Received: by 2002:a05:6000:29d6:b0:48c:5304:5e50 with SMTP id ffacd0b85a97d-48e5d331691mr7785077f8f.0.1793270465337;
        Thu, 29 Oct 2026 03:41:05 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48fasm33467703f8f.31.2026.10.29.03.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:41:04 -0700 (PDT)
Message-ID: <a0a9ca65-a28d-4361-9813-99b584b9148f@gmail.com>
Date: Thu, 29 Oct 2026 10:41:06 +0000
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
Subject: Re: [PATCH v2 1/5] io_uring/rsrc: pass import flags to
 io_import_reg_buf()
To: Anuj Gupta <anuj1072538@gmail.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
 <20261022144501.2478417-2-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022144501.2478417-2-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 15:44, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> Give io_import_reg_buf() the import flags argument and drop the
> __io_import_reg_buf() variant, which only existed to pass them.
> 
> No functional change.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

