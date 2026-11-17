Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883610;
	b=Ixmx/5LFSlldo8T5Cf8p+MMc9Ebu66514NyJLaY+grINj7xffcmqxQdWB5IcQD1kY0mE
	 /gKSx24ZDC6Rof23Y6QMHaxwRFhju7ChJX3vAVLP/mTKp+fIU59WbWj0gCQ8K7/m3l8by
	 qdAW6uDvICmOZLQMlLTYelCwdufodeywLJmY93LgHS+0vO+pnW6JFLfXOZMHg6kUajyr3
	 Ma3ux+ehBsZMh5E1UH6vXoL4AwZFJJFR8B3Pw5GRHX7z0OAJ7ay6uJ2gUqwNSd0vuV1fs
	 J9qQoaGVpS0YU1GWrERFem/M0/tpMppghY8Hq9oz0hYLPYYuvRlOvo8+W+7L2zHcqrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QRvR9Vcznhv/w1wRd/LL8U5gAXQ3HudvDWpKY1ruICk=;
	b=NVa05nlLMcnNA8781tE9gEZMyhm1/tUzbxX1x2ZzRO7/i+WlTBbkNuCvcIhQIrxjdTgZ
	 ENfiPhM2rzyqpvElABl2Ip7Nu8vqtN3Wv/YYnM4xPEXh+bDmqBDiWaSVjLACsbWMb9b7h
	 94cjVvmi7qgQ0vCRupwqiL/6j6+ZQl7RPGt2Yb6XK3uNV8/MJFrayMEmE58ZizeTeemJE
	 stHP1mvlIaReXOjec/Nki5ohptBF6jvEeQJOrHi6vXBQwa3b8wwoSp7FZRdE4phk/HxCC
	 m2HiVWmKbUI4KtoC8hM9gOHLfu0rj36M3NMA+fws5qUqkzzLG8kI9GjyLFLkEZivexg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tg7KasK9;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E54B606A323
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 02:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E54B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tg7KasK9
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38133db970bso735952eec.0
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 18:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794883609; x=1795488409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRvR9Vcznhv/w1wRd/LL8U5gAXQ3HudvDWpKY1ruICk=;
        b=Tg7KasK9GenHBhrAXrzo34P4RoCHPlENdUm0dbB57dGDrdQtm5RXNp0Dz9/Pcspwg6
         r3uzL8tWzxJ2WsBQudX33ajhMtlgFFWBxLZfKAWuUtBcXKSwb80qfFCRCHQzLg1Ad4Mf
         ZGihtitnqKdt9X1/NjPRTRt462GUJY1t+VYytGMFAPw96NyMqlwee0Q1rT6cQz3p7fvb
         +h+C41+J3kgW4AFqxp1OIadcdfo1MyJZk4KGFIXIepRtmPjILl8zW5zhXJR5MEoop5Y5
         V81GA6v4kQ+fL0P2g2EI/jVGeOjimhD/s1xaUAnKoXkTnfkdIK+qo4oqTaXGn6YuuECj
         3YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883609; x=1795488409;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRvR9Vcznhv/w1wRd/LL8U5gAXQ3HudvDWpKY1ruICk=;
        b=SemYIa4d2mjc9WVSb0fFEqox1tZyEOxgCD50U38JcYkmWw+Zg6BktltR3M03raNMl4
         PITPYOnCr8cmv8ZSp40vcSYARfyfi3EUA0zEwRDwETv3QxutDggJlldwaNwdNH4qtCVn
         fORoPZWx46l475wpSlZ/Eb9tv9iUiVAzYKMWzDOhY9xgUA/QrrmiKtuVQ/S64K4sAXv/
         XXjpDN7NKF+8ITA+yRVFNIKmoTQA66+zm8p+xjN/cg95nv9j7OGuqcfkrp8Wqnsu6VZd
         LnNFbnsnFTKtDOJXERFw+lD3bdfqSw35O3qP1PIa5vwkPTJzCrc1YI+WNFXN77Mtd8K6
         r7rw==
X-Forwarded-Encrypted: i=1; AL+hErHyDKby7TcxTd4luNcvhz55P1VSTR2ftJRZnfgDWXWK7XR7I/d7/uJ7Xv1yt71G0oio/JfbGYdR8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ur+xQJlDH1M6fjexrezZTvzmUDqPc7cWQ778ofQNKPyK7a8TM
	9jf2zkIWpRxZw9ecX2krRc4NbCks7NvXkfSylkMrTjQTgk9XoO1L/svY
X-Gm-Gg: AZFdTZcGVnE36bklFMztWog+/o/extsKQ1wxjky/FkhwANFOTNqr4r74hkBcxL8jGP7
	1Yj44BD7qd4vr0o7b+9x6MFS3OG77m3B1ayQ0drotDDSMSSFW8a23tng8t1mEs7BbbJKhndboSY
	UTVTrMsRUDxmSE6l8jrf2+ixzRa5M+5Bxb2CDaYxDejKmsAn5tNWNiSQigOxDoM8nz4WN/rtN50
	fKJD8TxJbvTKgVq+Ho89G1IrmJ+DB0wMJwSLvrPUE6ukxMAJ/S5PY+tioQCnjVnbWedwzzqgLPv
	XMMEXQuBhwibtFQ1BBSTDe/3j2wEGW5aN+cV7i9+7dva35wLltBf6UQYBJiHbAaz8uKzdSMII1H
	qOVYL2V4LNhlk+zUE0R5Xqo/0LHxdwlzlbCv/42jmUq47wSzBvWmcxUmZY6bn9laA+4uQp5fiTl
	559n4iD5OscQeID0Hc/8KgtqThRnRzmRJ5Ox5W7iqOUuiInzU7l5Nv5mF+kzoJw8tz10/FGTzpz
	slv2SpERJv3wsmEK1m4oDoE0StplCau3TWKdKQgycjJAeG23qbV1qtfIIt7S5jKsHp/hA/wD4i9
	wcBD8D6mpXQqhpwbnjjAPHLtuwu9q/vlTziO6WabDCyaADW5q1EPUb/0v48bXBAkLhWm
X-Received: by 2002:a05:693c:894c:20b0:381:a037:b060 with SMTP id 5a478bee46e88-381a037c019mr74628eec.9.1794883609155;
        Mon, 16 Nov 2026 18:46:49 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm39063508eec.14.2026.11.16.18.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:46:48 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: David Wei <davidhwei@meta.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/timeout: don't rearm a multishot timeout on cancel
Date: Mon, 16 Nov 2026 18:46:43 -0800
Message-Id: <20261117024643.478059-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <71233dfb-bcac-42df-afd4-45b65dabbc09@kernel.dk>
References: <20261116044519.281756-1-teel4res@gmail.com> <71233dfb-bcac-42df-afd4-45b65dabbc09@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/16/26 7:41 PM, Jens Axboe wrote:
> But why would the app do that, to shoot itself in the foot?
>
> I think the fix is fine, but the premise of it is very odd.

Agreed, no sane app would do that. The only thing that made it look
worth fixing to me is where the cost lands. The drain runs from
io_ring_exit_work() after the task has closed the ring, so the time is
spent in a kworker holding uring_lock, and the app can no longer stop
it by being killed.

Without the bogus CQ head the timeout is still rearmed during cancel,
it just stops once the CQ is full, so the change mostly makes the
timeout handler skip the rearm like the other cancel paths do.

I can reword the commit message to lead with that instead, if you
prefer.

Thanks,
Cheng Yongkang
