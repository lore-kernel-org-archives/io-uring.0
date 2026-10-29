Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793273670;
	b=wd9qmkY6orC5hxvFOfT8H/qKLkdraNuHOzSxzMEvYARwB9IBPAK5zySQxi3gTpVj8sUJ
	 04/QAihb5ZojLHHMZYCSv1lSol5cPluyVyS24JvCW/68DG1DPANOGogo54HB8AqKRRuxm
	 /bNSHs+RbgNKSjaG+VlBAqFY3rjA0eofMLuqirQPLlzft4K8A+qpC354WmPbPQFhPT1z4
	 UPKVDqvSw2UAuGRGrKjZoI6vbjEv5zMsYAnyz7jOIrTaj+pTdCtR+3gSLlTcEXzoctjNz
	 ojALLqLARoOqC5AORw99vtfhjCw6Lt05oc1i6UJdfDLmQhd7MPMowKpX8HxO/TCpgpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Fxs2p2vZjp5Ja+55tP7VAzUi3885HhPUvSbaP3WtHOs=;
	b=rQORgkMiKnVmYALNTKBNwphtvttIxeyb6Too2MY+QZ1tJ7dLdbTM2pzF1U9V/JmvBzIC
	 hBLbFPfTDd6cJEqrO2LItxXyOdy8yTrWrNAkRwvgj5jxz1OGG4bZjTR3cIPnOZLKUX/wE
	 kgko5ljjrERCwceMXj+0HqHsz3uQyiR8zZjZUmqEg/eB9Bmy+PXtT7rQ4A8B9LagsIiDS
	 2mq8uWgpDKQhAPSYPRqgy2pfTt+zAmLfmDi73rxM+r3dttkXzjOkp458Aaa7huwE1IYFK
	 xoiupdiE+7NX5ZZ3dPmV+I6tUXWUQ3CvaV4nE40tx93GD1o8RcULqg/mbRnnM54uIMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bq1l9Kk2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD897606A31C
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 11:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD897606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bq1l9Kk2
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso469053a12.1
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 04:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793273668; cv=none;
        d=google.com; s=arc-20260327;
        b=S+4foIXCw26H0hv9NageUqEpj83NeqsHf0PaXy7jltLqZKDUhFcjSu5ZZ7Ckf1VoO8
         Je8VswWnLzB1HTfAStvzpLmvi9+rT3mOr8EMi+V/vDXmJ9WGW0zuEykXO+YOHtCFen5t
         ZrtugM8UUUX6ztL17vxS9nH/viCuQ3EH5d2K2C1lbYV8r46QjdP3/zjOQ5zIPFZsXQAn
         JeGwGgq+jTTn/1hPObPPMyPAmHVlnzVa8FmjEeVVs2qlk5su5QwGVWZbKMIXQRQ/il/B
         R/Rx499KcIdT2hK7XuFvB8jG1uV9/5eJOVAlM1ktX2TubRhAKw0mmauUl3kzfevR28PR
         IxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Fxs2p2vZjp5Ja+55tP7VAzUi3885HhPUvSbaP3WtHOs=;
        fh=30oWJOzYcjPaUiStbYus/kKBrcDA25qOakDA+vluz7U=;
        b=hHp0I9I0BQ3RWxKvQJcrRVxWPpVxyFlu6VyAWndBHc6Hh3vvHCU+caAG0UydrS6A4T
         mHthmv8JxnseVS762uAC/2P9fphvvTkB8iZkdpvAvOgbZtrO5qljHi91xfvMS0TFRhRW
         K3VcIP7L6GsD59UDeVQNYiFN7ijWgVAOGA918kXDC4WSY4096CG+uEVQAzk3Z84leY1C
         fvrf9ixXkpDFhNCkP4GCieddqs1ijeus3d/3jOPsHiA9njF3LMFWUBkDw5kISaOkX4sh
         Nq1i0wiRmnwCi2zB6RP6Q9iWfHQx1m866HHc5DeFJ8hV0Zt1lYkuQmP3UgGZwzlmZu+X
         PSTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793273668; x=1793878468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fxs2p2vZjp5Ja+55tP7VAzUi3885HhPUvSbaP3WtHOs=;
        b=Bq1l9Kk2klWw/DsfkHAK7wvtuf8i5DHvjE2Tdz0Pe7ATvS1JG/hCA8ilHYdAPSfWAr
         5yLtVeUXNgGFhjweQA5S8tZ5/vpSFmb+fdjcp077kbitGh/5lcgE3mvyu5QWpl4eP9Qg
         xfwA5fJeDwpLzXcY3qdyiYb/sRdPeUWiTkw0O1g9QZRU8hxSU/nS9Z+vzGY4eP7lf+GW
         CGOBBDbvFHoRrZ1orA3A74hz604qMy+6PhVlML99l9fiOIXfmf2euwDE39OUHMAAu/gk
         vuq+tUuT53zWBzmHhvuljEiPJRHQ0oUM93ciamz5y0+jOSEqVU4EB3s2RH1ZxdFDEgfv
         BOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273668; x=1793878468;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fxs2p2vZjp5Ja+55tP7VAzUi3885HhPUvSbaP3WtHOs=;
        b=YDKr5KJ8azKxLUINVUJegyLaArZFVIF/zb2Ts8tZTWKeEAApATD56mtKg0zz4CrCE4
         TgC52bJHl+2CeGHJHuIevI0ZKLfulv1No/qaj8hHoX4fJXHnAKcExcyy5aUaU4JEfuWZ
         YPM60rLVR6QHuAnnVYbXx1v4IR3bAAAudeTrxDb8ssZQ2rHsa80PZ5GjogfARb+XiMFW
         9IUkOBzEsNCMz+kK1xjheRsHxAr2pRFIWoDC0dYNhLH4M8aFt7tjtkFgfsUG2n8ElbjB
         Iqoms6YA6BBNam79UGGjp+Ggj5/GdExjIqBi6cU/BnTvVeYibRnEBtg8vUdyVeaB+S7V
         s5iQ==
X-Forwarded-Encrypted: i=1; AKwUvByx0VfMtrRrXqsnijd60LPagwTEbb3zph4ZSwx3uRbC4hNzEX4p81mugo/yuQsNmIfihDLOjzsPJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQE2TrX9Tq8swXhIu8eVQ2dhwOoaoG1v5TN8hZLe0TODUegGtc
	2v8bmeDd3S2VeW+Ip0HI5M0IBWuCLRRYyB9w0xL5/HV/TVRHxVnSczfj4xB0fK+jMgoY/y9NJS1
	JrHnUo4/6Fn9PTJF0O66v7YUpiyqJMQ==
X-Gm-Gg: AYBFou1Z7X73ZwUqf1yMnUDEjGBZmFbTjzKYj97lOpuFByZZzcFl8WAqK3B4PmawjmN
	XHNu17AjfqkA7LQeVT54S0tlbbk1MtiR4qUYZ1I7mvA0QGT0ycNlFEK/Tmb52VQTg7RZhdWTKX8
	XnxQQq7IVJTQ7CQQqdm+vyPu9z9xK5zqc7K/pb0AvtHhRoqeuA4SRKDoMOhg3BR8GkXE9m/XLCI
	0JchVpvmeULR0IwIToqbOJMGwvMcOymDsQenWp3mIBI+moV3NaB6GHCOzOT0qUAFfEOjIamqHvx
	ifqFq/7+ABb1ARINsjpdXor1l2SGUPTWDyF+IJt+bYu/P2Np5162IOdxTDTTJxYu2Q1NQO3TOX3
	J70PM65nYiyavqO5IxPvnytqdWHKdAe3E66ptkmTGNx4gVVTCr44UfEN5szFE9AB/eAGjbuTQFj
	TDtf693kpUy38poGjguOZJLTUxBvud2cFGC8XSnf7nBQiX
X-Received: by 2002:aa7:d386:0:b0:6b1:bcb9:15a with SMTP id
 4fb4d7f45d1cf-6b49cbe4f13mr2485749a12.20.1793273668033; Thu, 29 Oct 2026
 04:34:28 -0700 (PDT)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028181412.1919506-1-kbader@redhat.com>
In-Reply-To: <20261028181412.1919506-1-kbader@redhat.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Thu, 29 Oct 2026 17:03:48 +0530
X-Gm-Features: AclHuK80QgKYucRyIWXZZ12A-Bk4L1d3Sa54QPpy49ElFlJWi5EmglCzjpxKLqk
Message-ID: <CACzX3At39QvtmM=sGh13+uCaU9RWhKW8e8r1hPLMJ3LdFAsetg@mail.gmail.com>
Subject: Re: [PATCH] block: only fail dma-buf bios that need block layer PI
To: Kyle Bader <kbader@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, Kyle Bader <kbader@ibm.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Tushar Gohad <tushar.gohad@intel.com>, 
	linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Looks ok to me
Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
