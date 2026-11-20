Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795134421;
	b=tXrNv1FeZO3K5VqQFS8uP1caFXyTe6ogcSgLehxd2SP+d+wfxVmZeQ21N08mmt+niCKf
	 vEmFlWP/uLz2SLsyNHvXTQfvu3gUzG2x3q8Ofnr3lCNuaakaDT33gMjG6lPs5rh1Y68Cx
	 Z0V7KP/mwtfRfPGI3IXQBTAfs2x2kE09di2I5E/Qr4YIopPauZD09qdAO8Pk205b3liTN
	 ckzMgRJiSk8HTerKFCa1ldwuvRQoUrBCz6aV8JagEgGrxvh5tBfCVLex/T3ulNIZzZd+w
	 JCLrlD27Vdt0LVkO8wq5DjHyPfe8eSLRs2tGQlXAq8yfZ/EJ1FI9ZewZlXjfjjjwU4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b9j9vXtfY+EbgPv2tG2SsfgvXGNMtTujxB5ZcN9bBcQ=;
	b=JYWyAjvzK2WUh60XG5BrQefgfYNeYNIJbbYWEqzc2UPD95L0gopwtSK4G/3VFMq5BD2f
	 0RCvAMoPrkpIlWkrv27hWlMIQUBnYriE58o0DePIse1+dmIQ9je0VSZ+3a6HW7KebokL8
	 bJuvFGU7GbUKAlaevDmDEPFBXiAdem2qDqpp2bhJxtjN0WYV3A5MjlBYnL6FcKcxzXBYv
	 qSin8Gqso1QCY8dgOizvyVTcX34Y1INsdJtB14QciKpPHfSRIpLDmSFslJvI2h/JDB+Iu
	 hXUHIZ8X0nmW+9UKxQM0F44lh2hfF4x3tlxv4O8c43SUmsMuFaXSq2qGNnvxyywXOgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlHlNBRL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20DF606A325
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 00:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20DF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlHlNBRL
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677d35fd1d2so447731d50.1
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 16:27:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795134420; cv=none;
        d=google.com; s=arc-20260327;
        b=k97RXCiY50Aoz94G1XZmarx7BZ939GDjLRzDOAJfENG7CuHgQQGCDwUffX9lbEcxk7
         ZgewR2LIO5weWYikOcMak0AkWYKJVYSjR63NGZ0U/nymgb1eXAkeQTkmrd4Xu8aEK3t+
         Jrm0m1YubARtKNAlX6ZX4gxrPmrEYsVuurVU2KCFMaJP9pKyLPT6NCjnm9yAlxGxtwUo
         j27wa5YC4UDBiImTm0e8eSedQNRphXBaxgltVlkZcZ79kDZiztVraulZDLkJFAa6O2I9
         2Zufs1C6S+5b1RslKHy1tmPUMUwXqeVobGAhhi2P116NM69vR1ZFFr9G1xJJEH1qiTtD
         TPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b9j9vXtfY+EbgPv2tG2SsfgvXGNMtTujxB5ZcN9bBcQ=;
        fh=Dj76NreNeZpqKsJp74ck1sa0xSrOtmHo0eZhah2ZYsA=;
        b=HDS/i1G4fccdKmsKHuSrDixuLZtdpdvE5b6KdtYY5qi6VjsMnBQy4JS8M/6CCO+R6B
         Xql7nHyZJhM5h2OoOCk0JbjOERQyvJifRfzvCTa4YYlSUrPCr1XbKxNEXY2XNRHryPvf
         OG/kZ8P0/t+mV5zLqO3DN3UW3h/YSNVn8n42Z1LwxEmtgPgREGX5NgLr1OAVsLk4r3MX
         LUwUdbVT51KS1lCNBT3KULMvuzCI03ubD8rC/yoEx4ABo8POGK4TxNBigU1qWfO1MH98
         Nm6DcgxZDZwE7U1DrbuM/isZAGWtgY6XaZZ5oTpdIv4lGdW5cLKXIDU+dsho0NcyDax0
         8rxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134420; x=1795739220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b9j9vXtfY+EbgPv2tG2SsfgvXGNMtTujxB5ZcN9bBcQ=;
        b=KlHlNBRLnkbFIkyiQ4dmD5l2RFLqJtNmjLeuxHpj1TOb2ee2RnbntdxgZUOS7qRia2
         Z1Du+D9vzUBMPZJERe5mbTyxNkcJ3/9wS6aBfdwtP2Uk7LBdC3YCCct8fO/YWGwc3oMJ
         qaRGbJbwNmIl8HOICnk1tzWdc0ucVXEg4oInUi+qS79oBguSq0lU6dBtYaoM0ytC7m7K
         zIV6+IyVgbMxnr8QBP4xST2fozCfU8ujzWrnRvhm2HoEvbuPNk2lexVqSRugvuH4lVdx
         dYOMvIhUMbSRDqxoiLaAI7pvPureGzSOIjFhNw2LXDqxuxctKdTNMP14bClGPSBPDGl4
         67Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134420; x=1795739220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9j9vXtfY+EbgPv2tG2SsfgvXGNMtTujxB5ZcN9bBcQ=;
        b=PGszgdSYJ9TtjK3XfqnLyGlxG53BQhAijKuOtvhrbSVZ0SR1LcMszdMd3rW+S0O8L2
         V4ZW3c+xZKoIlSQnM/qUxsfAbvUpwO0vREmagresvsgJupoLQjP639EiMjngs6f1m7Pm
         IwxKCtw5Bn6628pfSBolTu/URuUU8DPlzuGrcn721HF9XvN4w3HpvAi9vVRmEH7kmGXH
         wKJtTvhzrQIgQKx0Vi0CNIhftlyamqA7pSENIbhpwiY/Bb466SMuAvKTtV+TnnrVYcmm
         b26zjT5q62jlkNKKvrp2+9pX7A7UFGsS56q0saGyg05NqedBkBwb8zFI4bLp7aDvdSSu
         By6w==
X-Forwarded-Encrypted: i=1; AL+hErGhj7YswP5wxyDI60sP8AjL6cCBv/VDU0Q7iWCSGnXe+RtEOUFyL3s3Gh6YZ7vj8zxJUDg0Vmg/kg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EQeaKVK5WSJm7x/UXYHepDx0AjTYqm4DlxHpNWNT7ipqZBd7i
	/1ec0GfELIUe4dbo2ohfs+BAWIj5artgoG1z5K+BDvRXraqdCmlFpLKqavxmvRlYIr4V9nxhoOh
	NHlX7pmIG+H9dFmlLsyhu/o2Php49dIg=
X-Gm-Gg: AZFdTZdqiD52glS8vvW9RYWf+NAHLxNiODlFXG+bq6naaqmx5nAdcbzAK4FHrHnQxeW
	OMFokkJDkFIBK74jAjFvIuI57XbZ9jngHtPIh+Eu7Wm1AaRBUiIFALjMcxMNQ4S22Z5/mR5/7M0
	WnY99cjbt8xWOQyB/Xz+UzCgBfNTQA+1v5kjnq+B2hGnwA4Sj1QDI6EzMOgdfvw7+nC4mRNlXDt
	0okHQk9EWc/n/8pi1hPOkGVDuyHM4dUf6fNfwfzjosCJmrf2TVoSTGAQeTMU9BZeLuDJI4G+pNb
	vNQUV4nvQrOKOPdxMDj2XnXtur4G7C2EletPCYVGQ5/kh9ngLctprAAD9SO8v8BXYNaL1PbXbwf
	WEExLEXQys8HWeXfnyBDGU5HkF6DYtllqGQqfd521cW29kF7kRLSlItvOEkRA1qeoBM0DZQ==
X-Received: by 2002:a05:690e:11c6:b0:67c:4b5:d5ea with SMTP id
 956f58d0204a3-67df40d1b21mr504880d50.0.1795134419928; Thu, 19 Nov 2026
 16:26:59 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119232935.1708458-1-thiery.louis@gmail.com> <20261120001114.61077-1-brayniac@gmail.com>
In-Reply-To: <20261120001114.61077-1-brayniac@gmail.com>
From: Louis Thiery <thiery.louis@gmail.com>
Date: Thu, 19 Nov 2026 16:26:47 -0800
X-Gm-Features: AclHuK8HpDb3YGyRkewngiL9iq-G_WUfJKYzbVW6WD48cpmbOt2XettliD_eIU8
Message-ID: <CANox1RhDMiP2nQodMyf5KndjymFKCqgXLWRPf4kdwko2ifkCWA@mail.gmail.com>
Subject: Re: [PATCH] io_uring/net: don't charge the folio offset to truesize
 for managed frags
To: Brian Martin <brayniac@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	Pavel Begunkov <asml.silence@gmail.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the corroboration, Brian. Been playing around with this for
a few months and missed your report from this morning. Happy to have
the Reported-by, Closes and Tested-by
added.
--Louis


On Thu, Nov 19, 2026 at 4:11=E2=80=AFPM Brian Martin <brayniac@gmail.com> w=
rote:
>
> On Thu, 19 Nov 2026 23:29:35 +0000, Louis Thiery wrote:
> > Only the in-page part of the offset matters for how much memory a
> > fragment ties up, so use offset_in_page().
>
> This is the change suggested in my report earlier today:
>
>   https://lore.kernel.org/io-uring/CAC+fX10wVVSqGnfCg+aazorsCxB34sUDV-XJi=
BPd6R3Kuqc-7Q@mail.gmail.com/
>
> I applied this patch to io_uring-7.4 (0659e44ce739) and ran the
> reproducer from that report. With it, SEND_ZC from a registered huge-page
> buffer is charged the same as SEND_ZC without one on every row, for
> hugetlb and THP, including 8192 for a send that crosses a page boundary.
> On the stock kernel the same run shows the overcharge.
>
> Jens, if you apply this, could you add:
>
> Reported-by: Brian Martin <brayniac@gmail.com>
> Closes: https://lore.kernel.org/io-uring/CAC+fX10wVVSqGnfCg+aazorsCxB34sU=
DV-XJiBPd6R3Kuqc-7Q@mail.gmail.com/
>
> Tested-by: Brian Martin <brayniac@gmail.com>
