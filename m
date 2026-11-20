Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133477;
	b=ij0Yx6kT0T2Jx70CKdMJazw0ADVNOrezuDAV2+DQksVVW+lfKulkkMh1Kt1X+ncov0Sa
	 WpQj2pBywVlSVJaNfwEyVxp/rgR3rElNd1eBXQ5z5xGVKddoQ3tj9wSBfjfUU87sUGjAW
	 Uq8pjEXjAnjLbcREoSbFTe0Lbcsw7ZISDQivYuTVfofm0r9G5LhV4hx5osvFECIQQFX5W
	 8wwdspEbQ4Ik8tFYGYMgyZ+WHAoq1mBJTHp9baazeTfrOuyWYX3lb9N3n/oNNl8R/A8xX
	 GpsLcmdAzTP8lIQ1zjd6uPZOYbkgCHZCacpyUHfvii5D5rq7Bzjkwyd7vL4LjZ9Vpfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dX2sdwg6msO+2Hy2n1fUrye627ZQcDy+aS+NuM+NVo0=;
	b=2YloHjscy/nPasz5HSOecBDSp62yWgKvA0TNfMcocll6gZjpy/ItCbXzV7tITBKoLJ/4
	 JRapMWMD2QMX8ecxZM3X06/fI3z65+2a+JEDoxAqYW5TiKPaRf3wXwdUdpKaM9es6/Vib
	 wKvW5QeA9eKygRa0jnFtSMX+l+HcVVzOafQCFItdwLslDs8saYrQgmSWJJJoI5XhnIRM+
	 oIplkvZijJfx9F7fT/pRR6KxZ0QKhSHnjEdZTV6plw4VmskDJdQwdcoPeZMYIXMzgYKHP
	 VMlM/DbkuolDRdUFmfCR0HujoWemfW4Q+/3NoB2pdLoYcPuWjmEL29yv3VRKOneX/Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJqzfke9;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C6A606A32A
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 00:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C6A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJqzfke9
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b2f59de176so327508b3a.2
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 16:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795133476; x=1795738276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dX2sdwg6msO+2Hy2n1fUrye627ZQcDy+aS+NuM+NVo0=;
        b=TJqzfke9jFntflzsu6R0AwzaFu1KNFLU8Cv8ipBv2rtoWTIDoqfa4z2rJQpQwPW6rL
         AOSMR4Zx4c+j3qhAuY2j2geHE3njxRCSbUTTqPTTLQRFiIXxYIb7kEq3zvUQyzkTStja
         MFoMDiR5ZFpGXlfotungxVz1P1pTJ/Asymf+IhJ305ug/IcsdkeVlby2kS5ydS4XKgJm
         BAbxyKX1DTsbgaXIzQ1LX6ptXki2d0PIJbttKfykgChhYgt3/HT7/x1NPMfAxoaMS7Hd
         b2XQLzaGXSmk0asB5G7Rb1Z6PUqAJJaAcW3UCTJBwwfmC/iarfy/LdqLB9LUROync6bN
         US9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133476; x=1795738276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dX2sdwg6msO+2Hy2n1fUrye627ZQcDy+aS+NuM+NVo0=;
        b=fVSAfq90hVRd9xi3INeAtXa+ozYnLgkUNhmMl1R+ByNAeOCKRgLYhxUdPWNjSfCx+x
         v/46ztPzlDXwefBM0ANLgXpqUSll4iaFko7hUyMvp9dnL9J0A1olJ+MykUKO7ZrJV2EH
         XYLgHLopPn87SykZCNeqCPBRyR3fllv3V4PqGavR7aJjZ3mVuPehX5ry0qBsUEj/eA/U
         rAe90gLsZfn/yWfm59WHLVF69CK3GODnjhPqYZO5zj7dkKJtWM8xaMLnoeaGnRNsL8hm
         jj5JjVsiNkYlqGLC2cwR+OItpfLVDr4Iox3bSEMYob1Bsb/M2VO0ooCpfMu8VO9qk/xB
         dqzA==
X-Gm-Message-State: APuU4Z9azdCrSychs9EqKpdBXV7UoJgjducQN8e0+3JB2DxObhlV7Stq
	IBf6s1jBq7wgRdXK7OiPwnPY6BjeYlqCbenwarMqWoMQT33oHZHrHp+i
X-Gm-Gg: AYBFou22Kef1U5ON+phqU7H4uQ1SwNrQjTWzW8bjL8ZgAJDC+F71yEX8OTifZRzuNUo
	5o7TFoCE+K7JP2G50io8HGCDx+G5Lq4Csy7l76rJ1xpwrxQ5v9weW4Jj/0x5q3kZqFl3fLYjn3q
	X+lkUsWZsqlwD6RpIZbx5ZnqfCx1ogBPF7imucjDJ3AcMYYb8eZ0xkszw2H0jd9QRbivimfv1Hs
	Ef/+dzWlEKSImxI78cvtOCDoXXLoUkhTaOcGp5TtRzqfXSncHRgn7xAYSV/MSu6ZSRBLWEw1DJn
	/3VhjDEX5lzF0cXxjt2cx0w8v4Q54vG7c2rxdopQbU6a+aKZ7pQxB+zhR6rfiAsrdolmXGeHCuE
	iRp2P0AwLatnDsVKLvZQURDeBEROcqG4eO0/vWMbNKkyMvidyNWEBLs2ofIpNR2HsZxu3ineRZL
	CojaGhoXlrXjv4EOBasYukyZiqYkcy/PdeRlFOn1NqVgQTU29AXTiOyQRKg/bK36HIyQLYoii08
	h/ZqVn8epScGZ+j734gYtu736A+ZuGsHuwd2aPHStWjHqZzcQgTWnbEUngWko9VIczJ6zmU6yJI
	W6hKWNrAqKtzDsUspV7XChaD0uFVdqvUZBnwgDqGEScny10p2p25XiTpJdGbY/vlFvZRdx5XmpM
	Wipf4
X-Received: by 2002:a05:6a20:914a:b0:3f8:c7b1:688e with SMTP id adf61e73a8af0-4014d4557ffmr1304618637.30.1795133476084;
        Thu, 19 Nov 2026 16:11:16 -0800 (PST)
Received: from macbook.localdomain ([50.35.8.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm604400b3a.17.2026.11.19.16.11.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 16:11:15 -0800 (PST)
From: Brian Martin <brayniac@gmail.com>
To: Louis Thiery <thiery.louis@gmail.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] io_uring/net: don't charge the folio offset to truesize for managed frags
Date: Thu, 19 Nov 2026 16:11:14 -0800
Message-ID: <20261120001114.61077-1-brayniac@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119232935.1708458-1-thiery.louis@gmail.com>
References: <20261119232935.1708458-1-thiery.louis@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Nov 2026 23:29:35 +0000, Louis Thiery wrote:
> Only the in-page part of the offset matters for how much memory a
> fragment ties up, so use offset_in_page().

This is the change suggested in my report earlier today:

  https://lore.kernel.org/io-uring/CAC+fX10wVVSqGnfCg+aazorsCxB34sUDV-XJiBPd6R3Kuqc-7Q@mail.gmail.com/

I applied this patch to io_uring-7.4 (0659e44ce739) and ran the
reproducer from that report. With it, SEND_ZC from a registered huge-page
buffer is charged the same as SEND_ZC without one on every row, for
hugetlb and THP, including 8192 for a send that crosses a page boundary.
On the stock kernel the same run shows the overcharge.

Jens, if you apply this, could you add:

Reported-by: Brian Martin <brayniac@gmail.com>
Closes: https://lore.kernel.org/io-uring/CAC+fX10wVVSqGnfCg+aazorsCxB34sUDV-XJiBPd6R3Kuqc-7Q@mail.gmail.com/

Tested-by: Brian Martin <brayniac@gmail.com>
