Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441835;
	b=LE4IcmzGnzqeQjz0GYDwe+8EbjssjdaE7sNyqVT/ZyZDx7K7A/WN0Xiz8/pLABOGYCgK
	 2Pdj04/2WKB2byA4CtJcoAnFKSR6biXgC8ZKAoqbQakyhq1VPf2aqtUMwjAVmjC09WGh0
	 LvJ+lYrYU6NqiAVkwCaUnFVO1K73ll39tfk4tsyc5Eoq9+M06t8Llh0y1qt6hfS0Lbv5m
	 SgSSNNuO32dSBM+Tr9o1GbT4KTVouz620g3jIWQ0H2xfsRzX6GqFPVQvQlatb6S4RcoRa
	 Ic3w2hOvr3btPsO57WQcjohqeglkfk4gvs2IEycHBKLs7JkiLOSFlr2jsA6rU7ZWLPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
	b=GlgPqVBYPFXp+EP/XIqX0PVW7CMo2j0fqFtTWgf5rNNrwMgAuorckqXmC3Ww+tf+w+Ki
	 PxB0fYvJQDMzlj2pQYnFYOQW7ZRuWkbwc30GQh2G4+0lmL9xqoGp0gydp6/ZPFyjDe8aE
	 L6oLJ/9bJijc1r3Z3v6qHKJGzFCriEaT30r0RDo70xT91n149DJZS5MTrKYHdGdAst2Hz
	 seVwrPljeOicYyWOczFznRv+vrrH3gCBcQV5jNaoMxXmnrfG5Qz4merGbS3iLu/Aawnup
	 qIIMBV0drSpbRKL3ImYUsC0cwReWaS3cJlGxZs4huGRnGIBhYYZzPRCLNeZi8kuFuHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPTrwrK6;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E2606A33F
	for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 13:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11E2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPTrwrK6
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c511cdd5a82so370156766b.3
        for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 05:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441833; x=1796046633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
        b=xPTrwrK6fyazwXD6N9sRU8vdj+qov9rx8UD6+1pucPMFc5mHpXv8lKESKi6C1mJzb4
         ycZ0zXWRChTZshQJ1cbaXYqZxsUo+LicJygjVF6eM2kbd016s8ZjUmU5LhPu8ZHJq1/r
         mZITZKW8W8oqzTlBdGfiEdd879Oz7h7WFSwj6IJ3nDSMGug2qNM0tCumlY6DjLCn3x0k
         aL/YIk/W45HiPuAAufNWVdjLBv+ZIx7MEX/X2T9iJMK8YgdjYrMAcqTUeGjBu0gFBUL6
         R2kjwhNz6ET0I2cUVomvCJJ4zc8TukAuit9/P75HyzSPZr9nNU+WZQWamUxseIdC6wvd
         sx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441833; x=1796046633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
        b=jVNh4nlKAPtSpd2fgi8w53GafbUSflh/8NkofXpwZSKHI1LhTKENjt3qj4rtnoiNoj
         kHoMh3SNwaf0FZJF/oQ9XTyNuhAt/WZLHMatS1wxCtthdb88r04uOFHkvtVe5TB1fecS
         0XwCI2qYuHbFpRefhQFcr45fHENF7p9yxmRvtFqNd3Do90lmW2YllBoaqkNEYFndrYk9
         OK2GzrCsgJBmtJ5PfTwT6CF/yUuudIG8FiBSQcvvziJtxhh89jf7zkWX/3IcWFLyM5vp
         XGfWGyMZYPlLpB+GPwcPlMEDC/huN61FLnNIKgYe0OIxQCYvxy7PWvvMnBngOGJd1RxM
         uJJg==
X-Gm-Message-State: APuU4Z+06Lx0DTBoZmJgzXahHiaGCwHi5YufZs83+GRn0Z9rLLos6xcr
	/akDnMDEiepeC6BS3A8gVJfXFZb5J3ljGeYB9LVeeqeiQ3OY8sEkVJ5v
X-Gm-Gg: AZFdTZdOu7mXS1Lz1V26M0M9AgwHK1LaIQOPFRVKpowLeXBLd0tlqopgAByfYHzbKZA
	EVBuuE/UtEJdFuNvu2F9CtvP7uRFinMTYIIim5RHTwVAcBIc3OjkL6x+2ZzG1ayKWBMjXxUWCWh
	+K4EjWpMUYb51K5hS3y3PglKJSoe1c1cvxcKmr66vtFTR3iXE6MAdGqEe3C03IIaddpS2ZYUBUU
	PhpsB+HIzQJXpt3uR5OwU4PACwW3pOsNU8UnxntpH/z/yJ0tXmeuB5+vT6NB2tNvuK8C+SuZPAA
	0dt7hkLg40hJPhScr+uufmavuINMnc1O2aNG00jh3vqs35zYF9ZQTyonI7hU/ugeZQ+t4sZnSjn
	YqaHb6TY49Yz9Dizs6h13OMhkx/FlNXy8d0EzYmGzyUMKxw6tJWMZDLP6NITzerzdeOUFe0kwlu
	bH0nr3OCk5NoJHWRwZxnLiJMYiHZFiDevfIG89WRrGuGrqiiy5MkBodlwRYHK2wXmz9ZegDBEIN
	HStivSBZZxyttTlldMsxThZzA+lxS17Ge5iB0VzBJg+7AOR6QSrL3Lf9THJRpjOTm+mTEIBgyzN
	LSJRJGjDhunTfsVLsrborsv7T0oxlEn+xpScKkJkD5b5fuwII6Wo/PebfYoeyy81dHYGkFmyUOe
	5xVz17lkemG4q1n43OtM+wBTtrMvU/1kX+X5JPRv+L2iByKkeOfwZUSe79lzACnKHT9cjkhS4R/
	DAzfc=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id a640c23a62f3a-c513ab0cf13mr612886766b.26.1795441833283;
        Mon, 23 Nov 2026 05:50:33 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm410984766b.8.2026.11.23.05.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:50:32 -0800 (PST)
Message-ID: <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Date: Mon, 23 Nov 2026 13:50:08 +0000
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
Subject: Re: io_uring/zcrx: copy statistics lose updates when one ifq is
 shared by multiple rings (Data race)
To: =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/26 07:39, 徐晗翔 wrote:
> An io_uring zero-copy RX ifq can be exported by one ring and imported by
> another.  Both rings then perform receive-zc on their own TCP sockets,
> but they share the same struct io_zcrx_ifq and therefore the same
> ifq->notif_stats.  The statistics update is not atomic:
> 
>      static void zcrx_stat_add(__u64 *p, s64 v)
>      {
>          WRITE_ONCE(*p, READ_ONCE(*p) + v);
>      }
> 
> io_uring/zcrx.c:1337-1340.  It is called for copy_count and copy_bytes
> from io_zcrx_copy_frag() at zcrx.c:1770-1771.  There is no ifq-level
> lock in this path.  lock_sock() in io_zcrx_tcp_recvmsg() is per TCP
> socket, the ring's uring_lock is per ring, alloc_lock only protects
> fallback niov allocation and is released before the copy, and
> ctx_lock/notification is taken after the statistics update and is not
> involved when event_desc.type_mask == 0.  Two CPUs can therefore read
> the same old value, add their own increments, and write back the same
> new value: one update is lost.
> 
> The effect is limited to the UAPI cumulative copy statistics
> (struct zcrx_stats at include/uapi/linux/io_uring/zcrx.h:83-86).  The
> values are user-mappable diagnostic data; the race does not control
> buffer lifetime, DMA, reference counts, or packet contents.
It is racy, and IIRC Clement dropped atomicity at some point, perhaps
for performance reasons. I don't think it really matters though, the
main purposes of the stat is to be a flag saying "something is wrong,
setup steering rules". What's your use case? For precise statistics
I'd rather prefer to add a trace point, which would be able to do it
the right way (e.g. per-cpu counters).

-- 
Pavel Begunkov

