Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F443B0591
	for <io-uring@vger.kernel.org>; Fri,  9 Oct 2026 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519334; cv=none; b=Txs1XfN+tbKj0Pqh9k3P7T8Q/8Pw/qYEiK/wKVS0rRilMLiJUjJ4SpznO6r8ZhxzP/KkeXflDUeH4aL/gQMFRHF0EH0kn0pItphMBuK+WpjQifnhDiAsKIuYVzfDtOICc8l9zPOCtNDe4bG/gb7VYoajC4TTCILQZm/jr7oWi6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519334; c=relaxed/simple;
	bh=obDhGb5RLj9PYZ2eyCinsmiE9t59PJFY5sRh7w8PNpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovIzN5ZgsfaXuIaGeHMV6JRkrfWgGdNxQrUCwmzguv1DF9xxEtcFtK2AhnncUAENJkzhDCloV0WnhKheHHUg/nRzM/h4dOWZtaCvIAvviq2hec3DY9yYaiiwqXUHIQM8pZx+mSeA0N9Mu0PPPLYj4+0LWR8zWvKk/VdEM3GVsS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=kZpnoeZP; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="kZpnoeZP"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e515769d3so335781785a.3
        for <io-uring@vger.kernel.org>; Thu, 08 Oct 2026 21:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791519319; x=1792124119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnWq/2eDeNny1MK29b1wAOjSKjT1sD+08M0tNeVnBUM=;
        b=kZpnoeZPlcvKM0n9ji/eQOOihiVhLVb5lnDDkenAEGA2XoYdXbHy9WCxh5xn7CHsgu
         FoVXGD0WEgKcg8pT5pQwBYqyGT25XPl/ejMgHN9mIp/2UGkumZUz5woaEWJR4Y5vi7WQ
         U8QUwch5VMisthQTiBIGfnsSfzgpHVuhdDGas09I+JGCyg4aWI7jLhoeGQeLez0kdCOw
         rxBF775qHoZoj3yTp9SvgCRZFdLuZUSMy8KmeR50pHOdpZWKnM7/Imp3mD2Z674WoZkW
         sxCzQt6RzRLEr8bfJ5XcSxV3upYwloV81lExbTX9FnzavZDS7/5+y+K+co8FAPTht86J
         BKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791519319; x=1792124119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnWq/2eDeNny1MK29b1wAOjSKjT1sD+08M0tNeVnBUM=;
        b=BCPPv+Fr4ZBeKi787KdwBiHei5SxspKM+6yjDpt3ZQADK94x0VNm64g8eqVKDgi3Vq
         CSUvuxvbimPB8M8r3rG+gv1NMlHMruavwGP2sfjuxlvQrsMfw0sPyCbrFKCX0Mom9X2T
         k9DO4ZBY0VjHAjDgQMCTVpSf0izepEFfbFQSlbVXGXMEPcMiER52a+14qF4Ifwbo9vbc
         AWkNLvXDBQvTUsOfmRfKIHXn1ANwzLwKHc/2BDEJIf3Y7gbewJ7ZqJ8yvc8pkJnBiyDc
         EgRO2mgxt1roLGCTU/GqCQ+FnKUSqFzPcPSgVq73UxdmLGkPvCvVBzwHcw5Yg5wFLeiR
         +idw==
X-Forwarded-Encrypted: i=1; AKwUvBw0EIyCyyV8jUOuZUlOuKmNsN3CYUWAOH02/o9rDItOrIZxwOx26lrqquwgxHygQxTOcPuiJM2kGA==@vger.kernel.org
X-Gm-Message-State: AFuF++mE1oqsaO+iQnVo3yS6PfRI1QMx4Rv9lsiCF0n0Ed3cRE48KFJN
	a1pPw9Ma+5CeQht4xlvQWf2a2GsJhCzPadefrLycOjZTy/Rz9Ct6mRcHQxuqxrGeYw==
X-Gm-Gg: AYBFou2SjLLOHvw7Z4RBB8Y9ZpQAzad97JsM3he7opA2iNbQSaJDT6ljc6srrDwpn/i
	UlExrCqKvg2l8vfzD9GVI0aFN5teYCjLnjQbyeKOXwQyIGn7hKLsdNuoiXDbPetwm5IdEBgfK2Q
	r0exDuXStNj0Qh2aa8JIj/ZV9jQSkTkVVvIMCUnX7UIOwnXCGiMjJVqYuVbsfhB1KQlhifNxDWA
	cX6FUysiDTROyjDMx5X59fUnFgXbvilrCyGd/3ABAqaDBmRGSH3tMGCyFVBJmTTODvtrspicqlN
	BqYJoUiwh1pGChMGC+S7viLWahNE2mkzCo71ykfzk1hlf1QFABqdeoJjgT4t9W5N++VP7FBZULg
	6vou6SD3V2KEbwDUkixjCCZAiNOfc1TdrdP3wukb4i+LB+C0c8oMKau7dNgH8mcQJ3uCfM925kA
	RUlXy5L0IFOYCn59FUfJeiZeI4YPFUBMx0X3QUm3YznwrbzcHNMqgz+rI3OKH4QsJbLRSYr4ezi
	92bdnzEGKU2juGHn4cL2Q==
X-Received: by 2002:a05:620a:17a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93ebd21ffd0mr104850285a.40.1791519319093;
        Thu, 08 Oct 2026 21:15:19 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98906c3sm96184185a.26.2026.10.08.21.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:15:18 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] io_uring: do not charge user provided SQ/CQ rings to RLIMIT_MEMLOCK
Date: Fri,  9 Oct 2026 00:14:55 -0400
Message-ID: <20261009041455.1974346-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3b9d9c06-c6e8-4166-87d9-c7c220ad0b58@kernel.dk>
References: <3b9d9c06-c6e8-4166-87d9-c7c220ad0b58@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/8/26 1:11 PM, Jens Axboe wrote:
> Honestly, after taking a closer look at this, I think we're better off
> with your original patch and one on top for pbuf rings. Please check:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-7.3
>
> for the top 2 commits. If you can re-test one more time, that'd be
> great...

That works for me, and the two commits look good.

I tested io_uring-7.3 at 9f0c88b7f884 as a user without CAP_IPC_LOCK and
the default 8 MiB limit. Number of objects created out of 64, with 4096
entries per ring and 32768 entries per buffer ring:

                                        v6.13  v7.3-rc4  9f0c88b7f884
  rings, io_uring_queue_init()             64        16            64
  rings, io_uring_queue_init_mem()         64        21            64
  buffer rings, IOU_PBUF_RING_MMAP         64        15            64
  buffer rings, user memory                64        15            64

30 processes with 142 NO_MMAP rings of 64 entries each, which is what 30
PostgreSQL 18 clusters with default settings create, all get their rings.
On v7.3-rc4 7 of them do.

The per-user locked_vm count stays balanced over ring create, close and
resize and over buffer ring register and unregister. Registered buffers
and IORING_REGISTER_MEM_REGION regions are charged and refused past the
limit as before. Every liburing test gives the same result as on the
previous tip of the branch (c746673517c6).

For the buffer ring patch:

Tested-by: Hengyu Liang <hengyul@cs.unc.edu>
