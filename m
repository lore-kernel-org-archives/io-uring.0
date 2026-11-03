Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745820;
	b=fc5qaMHMaIjDF7kDrz2JdEojxojH4QuhBCwjR+AKz0ebhVJuKuqIGjPsZbjCw+tbhHGd
	 n+rhCznKXKUhGTaBrtOIxSxXBXBNGAkDxJpT1KW9tPzWM7rXf5ffc3ss2edAM2jQg69Nv
	 gF3i/yhLjryib9r02Su2WpAHCbX5/+MiR9n5RU7Nm/tj8F9ECB8W4nIl26Z6fBHRbSn/E
	 eEy1byFkMdGZpxbn4svWj//vLeIlNBYEFGN8jXwETL5v7M2mDsQHwEDUC13ZKMNtwP5ZW
	 FPEFhGp/ErEHvqFMb3LJr/t1pPlDQbWSDSbjfQUkTFSEDKhVplIodGc6mkaScBNTBhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IhCBPBTLwLGQ2yRs8VzMKJOKNOT0+JfZ5wDmbhkJDiQ=;
	b=0hyY5+cdr4H77ob4IqxD902IrPAMzwhqWMLyTsN+obbZ2Z9VtYNZpETij7SNFA+HX745
	 4+QezRiOaDoiQ4m2EEyoQJTZHbCakeMfOQ8q2cHTbwMSll/mgYxgznHv0s3vtQ5txbIJ4
	 WECqydyR28Ciormcpjr1Ftk8kXRog2zBKTLWOHNT4tyORtk4Nqwz7MZVa++c9rRrFFs2K
	 HZc7vwvIdzz0Gr4p8jynelGLPBJBuyR8Jbr7PFZeKhOfqMeG1IyoduxXRKq9Xu/BMQvi1
	 ef47BNSjZEJIuS5jEhJwuaSVolwBdTZeyDZ/nEGIFjbrdppOmQyVRzK9h4Eihl6rGzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elZzqx0I;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59369606A33C
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 22:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59369606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elZzqx0I
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso32664eec.1
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 14:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745818; x=1794350618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhCBPBTLwLGQ2yRs8VzMKJOKNOT0+JfZ5wDmbhkJDiQ=;
        b=elZzqx0I9zUMK6X1CLUpsfa4tiVNA4Al3XQoNBswiAzn7PdnkFah/8QEJ78wE+73+6
         vcn4lTEjiGv5nQ2lU4XVFQC1Z+iAOcAtw2XjQuVRwOfN6os4LS3pSxrEHJdD49oka5qo
         /rzXXfKf5TyRoI9+yPg0GBcAMdBWGgPmqqBv/ym0Y/GjO99OCCJyxaisq6Jv+KcRwJNS
         kKZs5VE2vs73M8KiLA5B5S3AwP/uag67O7cQCXiUriJlXPwQT/A7NJivpSoGaBtFLmf6
         A1+/1gsnouh4JM/sLtAVWxBkzq0L9Kvfs7iIefUdIAejv+SYym/2GiHcN69H/0/3aXER
         SpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745818; x=1794350618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhCBPBTLwLGQ2yRs8VzMKJOKNOT0+JfZ5wDmbhkJDiQ=;
        b=hA3zL1tG2tlPwcwD7eYREXYbzV2JKG5FjuWDE2YzTq0ejrTATW9AYDgDPQbmdOog+J
         lbzFqplNnzqCRWJhp3kcQ9GfN88oZphb4R6A9spAPa5CuVkBnjGiQefGnl4AAaJPenkD
         L2pnnhm/mwuP2VZNkNqODLVS3FJCxXrp7Ugn3evaqOYHVJtpoI/pZ9gggyMvUR9m70sI
         DXgiUbVw9zTtWkxshXgeY/pWAa2cUH4ASoLtqERi5gA2sU+K9j1MyYhRGmCtxwtmco6W
         0MdqpmEJ7M1yTS3jws7SMmjNWWrE3s8/miDPgTpi5lF2MlD2/yEzSgA82ksW8n9md4/e
         dRMw==
X-Forwarded-Encrypted: i=1; AKwUvBxzpVLUwhI37woT7fEho33sfkBmd2HIkbTfzOC1D5r7RAsLodtj6qcDEmZItgjwZEkkoaSLq/8D+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7rBZprNzvtY+umBvQV/lO/CG06nSMIUrFIc/kWUY/CJeyND56
	lV7IwaKj8bMTfMGZm2u3d4sBRyfuyg1eR4FXLuMoSeC1fN15vE+J5u8D
X-Gm-Gg: AYBFou3T0QCDlX5uov81mvrIWnAKScoC6FfleK5E/Ajg4l5POBau7k5eq7Ury91XU8t
	vJUs0n8c/ShclsJSQdTbsSZnPPszIgPl8HflzWtjM/YuYG0sQDwigG2o8E4wwI0Z2BaAJDtywXC
	OMCKJVJZPsoYbNucXwQD4wEY61BhtmS98+A5mSmQ7guXv+4tdLzVg4Fv92BiGsdaRN+DVj+acTM
	Wz+5z+bfshedIccWHh3by8VGukg6uIEwSHyRhT9LR1KF+Q96aoXs7J+Jqms29ZF3Z3hMs4Kx34h
	ryerTi9zAGmwjSm7RoTX9cPBeW8Ie41EybgFRy3M72s2Z50DOk62wUBkUvGyfTtOakuC3GvlmmB
	7V5EYGUbflZQ8TrtxVZehOyqfiztfApJJ98g38sqaoa7YoVFyugdo2JEynEupPd4XV/vDOn71s0
	QNgHnD6zqw91nOJHt0+OVvzgcU5OQgB73vw7MhFh0yFK6shppyEZL+iZiF26QcHBqwZ2IiszjF2
	MR31aMVefyIcRhPPIi5YIdlbfVpaDQmlNo0LBGpZDoR3zbQtzr6X8QUaS1SjsJsVOuoYYq8OddM
	YoaZ0pvUWxYaN2JJSRunxQ==
X-Received: by 2002:a05:693c:8204:b0:369:f3e3:4277 with SMTP id 5a478bee46e88-36a424596e2mr23371850eec.38.1793745818528;
        Tue, 03 Nov 2026 14:43:38 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:69::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm1323591eec.7.2026.11.03.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:43:37 -0800 (PST)
Date: Tue, 3 Nov 2026 14:42:22 -0800
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
Subject: Re: [PATCH net-next v2 1/4] net: fix skb->unreadable propagation in
 skb_split() and skb_shift()
Message-ID: <aupjSE3HVsbuEzsh@devvm16445.scu0.facebook.com>
References: <20261102231827.4088254-1-almasrymina@google.com>
 <20261102231827.4088254-2-almasrymina@google.com>
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
In-Reply-To: <20261102231827.4088254-2-almasrymina@google.com>

On 11/02, Mina Almasry wrote:
> skb_split() and skb_shift() do not accurately maintain skb->unreadable
> when moving fragments between skbs:
> 
> - skb_split_inside_header() moves all fragments out of skb into skb1
>   (leaving skb with nr_frags == 0 and only host-readable linear memory),
>   but leaves skb->unreadable set on skb.
> - skb_split_no_header() unconditionally copies skb->unreadable to skb1
>   even if 0 fragments were moved to skb1 (k == 0), and leaves
>   skb->unreadable set on skb when splitting at skb_headlen(skb) moves
>   all fragments into skb1 (!skb_shinfo(skb)->nr_frags).
> - skb_shift() neither propagates skb->unreadable to target skb when
>   shifting unreadable fragments into an empty skb, nor clears
>   skb->unreadable after all fragments are shifted out of skb.
> 
> Fix all three cases so skb->unreadable accurately tracks whether the
> remaining fragments in each skb are unreadable.
> 
> This issue is theoretical and was found by manual code inspection and
> LLM review; it was not triggered in production. Verified with the
> net_core KUnit test suite; not tested on real hardware.
> 
> Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
