Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616304AE8DF
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 19:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278020; cv=pass; b=lMuPEbhf2YqV5jklyLCtx2ntz2cNlM76HJ28dqiLC03vUCztLSRP7+KJidC4Eo7HhsfnLH53lWlFKpp8z8IgMSls+wrPgsuwXVFlgsNMlQLhfmPx4KbhAuM5aCVT//kdrqipUpfbBu97H8rltG977k6pUZKuWtpOoQ3lmKaTr60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278020; c=relaxed/simple;
	bh=yYxa5cHYFz+o6mtZX1mc8GmR4S70HG0QuP15znE6Z74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8bCAJ0jTRMLs4T+jCCkfOhRaJWlF7A6ten436Giazbjrx2PzjTNbTtfiYrnMiybY9rRLEndjOS/rRNHYH2MUYNKviOAeVGISLXnela3zvFa5R0he4ipKx+BLKbwp4+bgSU8P9iXvLG1Fd/KSsDRPBrBEZSmssU/jFKJM/7FEwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PMLUZbty; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PMLUZbty"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso2648a12.0
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 12:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278012; cv=none;
        d=google.com; s=arc-20260327;
        b=GraWFpt1aUWP5pPg/+0YZB9XvwChlSOyE+E0rEnl1VY/AYpTqfu8YvHr2MENMSCr1e
         v019W/PQPDKDZxcB2KKrLR5HbuwNFIgnEoOzaPTrujzdQNmpv+mWbClyJNDGq6bgTwHr
         Vun8vFLqqPJOzz6zsgJfCri1fkd9K4FgbAPFufHSFUQcKu004WnOiBrx/8lI1RWRebtj
         nGDPz1AX8RW2AevoinFESBQby2OLVI0fu9yPyME+hYnZc+K0KeT6eJUNHCjBgxlXz1Rx
         C8kRAJaD/QDx4mhk1szKambFVK1mawkK8HX+hR+coZSArwS1YLmn+eW6aS5OpZ1J0iom
         1GHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYxa5cHYFz+o6mtZX1mc8GmR4S70HG0QuP15znE6Z74=;
        fh=LDjm8y4fPN1Fl+eApd+BA8tl+lnO6tI/hZhr7fBqkV8=;
        b=dyDQ2FAwOIb55QJT95dBNf8l/hnBB6fEwV9vAkzpqf4Ik2znRs4mjkeF87pOitrpxk
         1T7sbVNHbYS4+CGi4c0WPEbW4A3W+nDyJHKVhaJgUwciyjCQ3OZsjHputCR/w33KH64N
         g4zC3jTG6BrsKBOtUr/R8ESG+LLYMWMHzpCJUI0UTk6567/EG3rhTemd2nDbZ4u7Gjv4
         NBZiZi+MxuQ/IB1LmuHURHaAO3tYo6dHmeJ1Y7u+luApO3sIjD639BOYTM2IE4wwaKqa
         bKovWBddzP0N9CEFJv3ZzCX7NMW9QGwgCtxAXLQ6GzioiMisN16368kP6eYP8XYdQI82
         1g3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790278012; x=1790882812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYxa5cHYFz+o6mtZX1mc8GmR4S70HG0QuP15znE6Z74=;
        b=PMLUZbtyMNWUwugoImgCOMKYy5drlDBLGOaShjfC/ebqZbWFtlVhF2WNYIxkuhyRHj
         b7+7qaK/fsYJplVuBlHNsJPlmCidJNrvRr9FGQn8K/qeK2n7syyBT/bL5dNvDmUTZ0YR
         YdU3JkQNWjg6grRbdgJowTfaKOL5lG/2TK0pOtJkWGV3ACSuEwAIIVYxX8PREVJzSIQJ
         TYa4OlNAyW22ep5AfpuNx69ddQAd79jJZ1QvezgJ4+X6/z9gkIhzfkYk8DAZqp0wkXES
         qBt6JEIb6kuK9BaOqt1fZOYXK+FW45QnYjPpKMKi/YbtdLismBZgwtkhYl+wNv2/aRY2
         ZPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278012; x=1790882812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYxa5cHYFz+o6mtZX1mc8GmR4S70HG0QuP15znE6Z74=;
        b=LI0aTOBwF07WvCKZVk09NDp8hXii3E8VfD4YHTFWDwE7HAum3hepjXavDZiRn+9V+l
         GYMqBm7X66KT2YVfBbnAZhZNU1+pJboih5xkTNKVlEGrXo4usUtyIyMC9LWREJY0dTZX
         b+MgY0LoAVXepqeLD86QGPyZE9CMvplCSb6xKjpiE+7UwZksEeFqesDHxc6HvkMhY2Os
         TjogIV8Vr0p57U52np+34Ou+q3t0ydBr4q982dArHf19TUV9ZWX99tUi3P+mI/ep3tik
         t3BXk0QLNkpi77vDkaCzYRHR8zwLOQrvaI6vCT6w18hQjmLxiDI3USLRSXyoDvb+mh2F
         uEKg==
X-Forwarded-Encrypted: i=1; AKwUvBw5eiAx6ibfhRecGXzvDBSo0DVsuiDVzoPj+j+sQG5JeW5PjSSWRAoClfGlV4yeOQFr4nQN+bFvoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kECtoRVxVTJDzZvWiemhsNMl5vFB2KFcmw4yUifz4CISnuAOOE
	aj60d48jxufYabQetTs92nL/io9Z8iroc7kSHIpXAST+tgbZtviSMUOB59Sq1YUvX+yxL/+lzEJ
	4l30PPMIyHlRQmWVagx+b3I2Qmo9uVfI46ELojDnv
X-Gm-Gg: AYBFou0uf1R8dqMshpOKI9Z6HrndJgTaCvWVXcy3mh0fRphmXVi+OtWlpG5GaPBzd5W
	T0vBfHWFSwcyLx+CE2BG/ZeXFT0MRLtJ9OQ7EWvYNPQ+B+EsP8b07fOTwo0rEajnJIzcWFjkDzO
	FQQlqOB04HRzBYavGcXoi+ivzs1RjIPePstJ/xF7MiKzAvAywjHmJE0egJ/2EYBjgzAaGTruMJO
	N80cbgBMDB68QYZeZsWItV+LicOiKWZuU6TxofyMHqgR8S2k7e2AElMjZjgezfevo30mn/lApp1
	kqNJG0kuwkhB18AaWO4PCLrTJvquS7Q0ouEmhD9XbT3T5pVsGLiChuTlLus5Xqr6JK2c5P7GPlP
	/N6b3KhUEYKI=
X-Received: by 2002:a05:6402:32a:b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6aae505dec3mr6769a12.11.1790278011541; Thu, 24 Sep 2026
 12:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922204348.717198-1-sdf@fomichev.me> <20260922204348.717198-4-sdf@fomichev.me>
In-Reply-To: <20260922204348.717198-4-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Sep 2026 12:26:40 -0700
X-Gm-Features: AclHuK8Infx3n3fxQpi6yWw-iI-ks1OfMwPCy13lk8MO82P-g6diXI4rh_Dls7s
Message-ID: <CAHS8izPTz6g8MR6_1v3cu7OEwZhokS7oz6qbi7tU_ZG=yeGz5Q@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: devmem: decode DMA addresses for TX
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, 
	sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:43=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> On 32-bit architectures where dma_addr_t is wider than unsigned long,
> page_pool_set_dma_addr_netmem() stores page-aligned DMA addresses shifted
> by PAGE_SHIFT. The net_iov branch of __skb_frag_dma_map() adds byte offse=
ts
> to the encoded value, so the NIC is programmed with an invalid DMA addres=
s.
> This can trigger an IOMMU fault or DMA from unintended memory.
>
> Consolidate DMA address encoding, decoding, and representability checks i=
n
> netmem helpers. Use the common decoder from the page pool and net_iov TX
> paths so both interpret stored addresses consistently.
>
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
