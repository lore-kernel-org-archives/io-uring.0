Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826017;
	b=hGIIiYwxIdajAQrZ4mu2IezwUBvO+SPm8oYTgX5/Lvt5lFOoZgzFVcm1ufaGsuPI4Dnm
	 4EN/PpGfhVIyBOAQlTh8H8NiqcHBNmTswMn2HpGsTCseBsWZrkf/Yf9hIjoGbAiTaqcoS
	 Vra6F0wR2GMOhTJwxlRZ/9UFYfpJo34a6dC6ny4JazhO1P2onsV1aK1CmUZasZ2KEVpn6
	 0+A3Lokt8NTtWUWcez4Xy+/jbsnlSy4DwtlhQhfAgdibaQRa1sqPiu/dNHCD9Nh5GE1QP
	 ZJ7M8dpVfBpqR9EX1pj1B47dP5O8Uu7a3UTIRDUPnYlD5+3zX7xaqCe+KaaEV3NHMQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
	b=0eOFe9Pr74xYjbvKftkA/hZF1fbu41WfiQ0UwTaDc9bMX+Jp9O75IIXp0Y+Pxpuwag3V
	 f97Nl+jYiuxoI6bfIG2fucohXQpBSrS5cN+P1J4vyNF62zLeHOUDr84t/jySrf+X41kL+
	 zG2J0+bcEqAuV706+lLrktF+6PUEQShJh5N2x28HAPT9ykl1BVLARiaUKKuyRr6roA+tV
	 ZN9b3xyf/3WUUddWniKsFW7L8H9fvY3haOHnWjm7zgFzP7+i1qhwggsuMj+v1SJAaYU9e
	 Hzq40Xb26kvu3YDJrT6z0ys9whsIXv81HkdSvsV+iYKarKPWxZhTITdixBEDLdO4I+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtEfMRUf;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECEB606A321
	for <io-uring@vger.kernel.org>; Sat, 28 Nov 2026 00:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECEB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtEfMRUf
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3949612a91.1
        for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 16:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795826016; x=1796430816; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
        b=VtEfMRUfZ3zyteX9vboA7JB9ZusTTGvzZOPMC/5Zmc5unjfrfu1V+L9VEVEdpbLwwm
         +pH3uXa35kaCWPzE4JrKggHljzEp5AKNSP0EWh2laOQZ91sB1pFNt1rAH+CwrZpzhuqU
         Kz4Yv+dgt/w/cahpmYsq9vgnZgcCuqTU/we5LM1IYaT2PqzE0NCasYG0QurDtaguHiiQ
         HNsHiqpCOkedaEj4y3PfBloCVIuAhjA/qv/S7hHqOrH6KRZG7IC/OIWrKVXyIGeyzv53
         ZWM8Du6OSmMvh3h18mCQ2AM5367yKk5sLJv4e8+DYrWAnMLRvrmH44wJXi8+qQT/8J92
         neyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795826016; x=1796430816;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
        b=WPVCMOxfVDl+PlydfyaicJrjZOJ+kcQDn5x1i83V0Ku3jBXrr2rzbQyOJvwW7aZCo1
         TVlSv3oOlRmbm0lt3li+QWrQtvPCkHuAiY/mhRMR3WIjjidFnXTAHA7R0N0276r3ZgYS
         cI+vysqqFX7Gca1kOUXfX2qq4zf3gcfqCRIu3/S7CMpJdhZpz4kx4C/B0VUHGYucrdoN
         0+coVIvWM+ex7a66cgby52oXoE1X+QMZNyUHufdf+a+K1DbOuZqHpASNDyQvslsAvLO9
         Tzh0iN/kYyvcdGwJ2RZz7o9blYj5oKMGxRDwyMVA/g+Y8DDEs1nQ0mzI+ISgDOc7Zzd1
         y96g==
X-Forwarded-Encrypted: i=1; AL+hErFMNGC9UN/50xbR5ndTM8Ozx4eJlEesS5tMdH1gKdUof41HfXqJ5QOVu8nxP9P63Kx0e1TGTwECuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qJEUt7fTEKhBkbMq5G8X22ugdqDzLaUrBnDUJj87Y0CR0o3Oc
	jvPW0BC41g1gV4T2tJCcjm+VeZKI+jm8NrNV0V8ETDYFkf50QerBEhZB
X-Gm-Gg: AZFdTZe/RI7tPvCEZrHgMuL1fymNbYxBejxS6TkJLFB+PWIQkSaC/PGXlry3ccRPtoM
	ELf3KyPqqIhLKQFR9UMl7cNB/G7gKWzXHd4RG8m+xm5K/b2EgDNOvhwfKLrIG/+tCfoC0D2savy
	Tnt1gk0SL0BtVq/4CFP4DA/vwiSD2Dy8alHUQQy+fKpjxWJLFLmDNLtEz8Lmk3iMusnXGAISRVW
	uQatQo87+4PLwoPb7KtLeNvVO7iBvvdLN8b8HY79ypGyvgKNfqeScDJLP+Ck7ffdd2dvsRolpuo
	JUayuRwvRkDN06xXZnDpnwXYm0vssvMPcRszi3DYhNWK8N63iJJ77rl6xnWVyFhO9Rya1l1PO/U
	yXVwnb+V4om04XDPCW6fy3ilEXIs4V0ab+I7U97N5bb7lzV2UeaQO2lEwq12/b5EA/wD/nXS7Jd
	q0dwZ2cEy42lZa3mj3qCWfxbD0IUToBzfqR6xu8vGCYeRnalnh87Nd/AxETtte7/d1XcHh6n/Oe
	mEnO4vnVqP1ySge/XFsEFfoFHuopY4H7Ii6HfgwuY4IVb3w5rPWGTGWK3qdot8qvkFy8M0tt+0q
	h3LSp7GdkWOwUrNhMLfYvyNDpzR4hASg/aqZgiPyOQy+zfyliTwQRQelyDZzHTosQPd6yM25HyO
	xBNxdSUCVoL2hg8yJNHGdXMLUverTrYTpFA==
X-Received: by 2002:a17:90b:4b85:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b41c7c2384mr26668854a91.8.1795826016052;
        Fri, 27 Nov 2026 16:33:36 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm30793634a91.9.2026.11.27.16.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:33:35 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 00:33:35 +0000
Message-Id: <DN6F6Y9I0QD7.1B49UETL2EKDJ@gmail.com>
Cc: "Kees Cook" <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: Re: [RFC PATCH 0/3] Introduce a classic BPF filter cache for
 seccomp
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <io-uring@vger.kernel.org>,
 <netdev@vger.kernel.org>
In-Reply-To: <5b1c03a4-f910-4f97-af3e-1b8c328dd1ba@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com> <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com> <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com> <DN5F4EBDNESC.3UOJRTCXCL4HI@gmail.com> <5b1c03a4-f910-4f97-af3e-1b8c328dd1ba@huaweicloud.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 07:15 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> The free path is dominated by bpf_arch_text_invalidate(), which sends IPIs
> to all CPUs and waits for completion. The wait happens after put_cpu(), so
> the task is preemptible. If the task is preempted, other lock waiters remain
> blocked until it is scheduled back and releases the lock. This can extend
> the lock hold time to seconds.

> After moving bpf_arch_text_invalidate() out of pack_mutex, the p99 VM
> startup latency drops from 2.79 s to 170 ms under the same workload.

Awesome!

btw every free still sends these IPIs.
We can probably remove them.

aarch64_insn_set() can do caches_clean_inval_pou() only
like aarch64_insn_patch_text_nosync().
bpf_arch_text_invalidate() is its only caller and nothing runs in
the freed chunks.

It can be a separate patch, of course.
