Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745821;
	b=TuW5xYSC6SJgKK8yrFCpdUY1JmYHiKWwq0WgSdNQNl9Oq7hzQpfoWnUUHd0IlwuxzoTg
	 9w+oArfRL1v4FBwgGH2bdQEyzMZdNnCZsYEomd9ZwUsXw6pd98lMy/uu3qIyEpoFcgs8F
	 4Ufei1C9YifMf1IUCUafRQe5DeGzr3j32z5QwO5m/2Uvfu60H2dbGKoVsw87qSgyFpUeG
	 Is6IhSQ9hFjR/F6zNtRFeUBw2dtGEP38ILxFSbFQ9XmMa6Q7yPrR1/oIGiDZVHjM6bbtg
	 5MUtlOndByrWcOIsfDWr/k9tB97U4+K+FOxovu5ykROyqNX4cKA6q/zxvfU6PcdpHew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pSX9ZEKMZwAkn/hCnfPGUTygE8W+cQbUvjzhzK///rY=;
	b=bfGij4UQw4yqKry33yUCCK03/aH+2Nm785oUzO1Nx+PZzpxoaK5xc2GyKa+vx59fE1xM
	 09fONez69lErb/KE2X7wAj4+/b+zmL0THenuVRA4E24t6JD4qeHuOAM8Q2HSYT4+lhsiA
	 Kno0HqJeFxxqu1Xixw6lU0rRmjMoIpx975bH8D+j8+FopoxRpDFQ6R0yTAesq8sb55d7s
	 bk+xMh06GzEbpc49rYrbvC8omz3XxD1IYFJRNUJTOE3l5wNlToiM8eCvkSsgYTD8zzsIB
	 h4RLdDAxfeCSqFuL13MfjKoALhIpe/IqlbK7J/kXvZ7NcgpD6gRKUY0/1Uvatp1njtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UbKXYRVS;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064B606D811
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 22:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D064B606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UbKXYRVS
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so38538eec.1
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 14:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745820; x=1794350620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSX9ZEKMZwAkn/hCnfPGUTygE8W+cQbUvjzhzK///rY=;
        b=UbKXYRVSlINnceEmcBZLntGOFm5h1Y6u19ZCL2iuz461uXDs/lkJ8Ft30u1wsxAckh
         0uArEiGHC5YoyKR6MHxSYmrVtUC4+Mc1jZ1wwXud8JXvPGzW9ZHJ7prEerFWXDG+yIEj
         IBdNNyX9BSdIbvaK2lILsfriI6VNcCRfcQZQuW+Id0c12gRA712+V2iEWSv40j9PRl8z
         exVtEELSOcZTiT1DYYir9r6Jo54p+p+N43N0fl5xjwnpJFMgnpC9ymb694sKrU4cDrJN
         dKKSv2VeDdj7NsDmG6DRrPslPYterr51oKQ8QU1ZkP9VZzA2kvNguuvVNGUjoY49y2dq
         42zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745820; x=1794350620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSX9ZEKMZwAkn/hCnfPGUTygE8W+cQbUvjzhzK///rY=;
        b=HtgQcLwF55EQFidNjII6rsIMwPupMKpevh8JxJ26jqYHO9VYEHSnFEhdPoIt7K2NzZ
         m7Ov2oMdURJVlC/UoD36YCbUS31mth0twuLmvjjMy6VEZU1/seF/jx/Z8GjeNocgKe5d
         XPYumPfNhcRz/IwSKSInvdqh5yJ++5IM5/sQlNL2owE3HUZt3AKb45Z4FleC0fqx37sM
         12oNAca10//xh6Pj+8xt8sLKFzxIeJTnVeBhx1uqSzKAkKELum6MuvvwngGi9svfMgdM
         byO08hiHVbadtOw69FVJLOIh2M5yvm/CZDrA3LwZZoN25ekv4oXUQp1MMcfySNcV/o1c
         8KXg==
X-Forwarded-Encrypted: i=1; AKwUvBxv69vvtssOPJXFWz1MdHM5tHqYbX6hZN7//+MjuNrHJAWBwYp/QVlpnl7QpTLDkuGpGn7xcn+oXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9u/rTqh21iE9HjKmWsL2SPFlZZ+2vgJs1y/6RlWDPQrSpOexQR
	pvxeCAPjT71+NK30Jpk4HcrxMDgTDdbRqtION98VTEtIZbtLnDki4WCz
X-Gm-Gg: AYBFou25DSeZp4p2hZhYm1Hox01CEJ+F3UkkmxUKyFl96Vk8mFnwK7CZlUF8/V12HCd
	rldzkiQveCbUeiAi6LlTzUyjwFFM8odjCw3a1vXYyrC2m+hUToZVEzljD+MUMblCWJB9e0IO6xv
	4uiFkSVbzg+1c0OeI/JG31qsA8scO2TqOh7AQnnUHaQj05c+kETVZTPvDRnvFhCps/txopcPxne
	UM+TT5GENSYbPjKE4M4CNB2L/I9GX/WpheyQDqs12Mbv1GZfCrRplw5QYf07IAt3vxWy3eWnq90
	ep/ZXD8LfAva4fVzrOVcwncf3Zqdd1YTOASEt7VNkCX1SD4adjvV6DMVTqQ3Eii2GK+78Hhg0mI
	mL2lRlT0r/ETORk4nzgjJugCvXU13clCGU9qPdsfBUj1GqL2LaT6XM2u+i6fT0ZApM+2CV5rzOf
	cju52V06OjRSz9FvVVel3MD3GHJ/Mee3LQjF13blkjdVJhLRdqv45lEFxjLZX8o56Kjp5uCnvj/
	HFQXlxhhkoinAnB7dIYIAv71RAUPDOAHQ7oUEVgXT88stimJ36LAq6QP98g49jHM2lLIpmCMlW0
	EzLXTTgZp1b0BDwvx4RY/A==
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr21867108eec.3.1793745819838;
        Tue, 03 Nov 2026 14:43:39 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm1484975eec.23.2026.11.03.14.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:43:39 -0800 (PST)
Date: Tue, 3 Nov 2026 14:43:31 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Subject: Re: [PATCH net-next v2 3/4] net: add skb_frags_can_coalesce() helper
Message-ID: <aupjezBugEQe_OSC@devvm16445.scu0.facebook.com>
References: <20261102231827.4088254-1-almasrymina@google.com>
 <20261102231827.4088254-4-almasrymina@google.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102231827.4088254-4-almasrymina@google.com>

On 11/02, Mina Almasry wrote:
> Add skb_has_net_iovs(skb), assuming skb->unreadable and net_iov-backed
> frags are equivalent for now (with a comment noting the two can be
> decoupled in the future if readable net_iovs are introduced).
> 
> Also add skb_mem_provider_compat() and skb_frags_can_coalesce() so all
> multi-skb coalescing, shifting, and GRO paths can share a single check
> across pp_recycle, skb_zcopy(), and fragment memory providers:
> - empty 0-length skbs are compatible without mixing readable payload
> - page vs net_iov is rejected via skb_has_net_iovs() (0 pointer chases)
> - page vs page is allowed via !skb_has_net_iovs() (0 pointer chases)
> - net_iov vs net_iov compares mp_priv (walking frag_list if nr_frags is 0)

Maybe squash this and patch #4? Otherwise hard to follow :-(
