Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EF431A55B
	for <io-uring@vger.kernel.org>; Tue,  3 Feb 2026 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138383; cv=none; b=kPnhGvpiSrPJn58S3hkH3FPCiHbrD/4a5FTJHc4k9/eBB3fMpj4ecijaWzaIoVmsRZwsx1q+4rT9GNqbIKFLmDtSws+CdUEdIilV6UyD7p+eT8WwatqS59cv32oYhbDrXDaQ8dl18Rl1s2zBevQwuww/c7xa+leJxT2ru2JmA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138383; c=relaxed/simple;
	bh=w8Rou2HoxB17ylx20LbdMGxdVxhIn3dQEFi0aCIWt8s=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=A5ep2JtXynlWn2+LKXeOT0O0mJMy0E60jl4FILkHtS0RI5tA1LaUblvpSuF9V9Sem6l4QCqzQ1cAQm0jQt78kI2DWzNDizqHz8VcIvSIk/9/SxZ092yxJA29yR5RLlggLNlaf8ctvdtQb3dTRVoBpWeeGVIjsOx/5ifc5DO07Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=0CdkxKe+; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="0CdkxKe+"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45f04f1348cso3560600b6e.1
        for <io-uring@vger.kernel.org>; Tue, 03 Feb 2026 09:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1770138380; x=1770743180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2zpSWOKVkTC9vunaw1bGcPyEvFrXlNi5n7QMNDoYpM=;
        b=0CdkxKe+gidSzfY0oX4aRdNNaI1MRLUZkThql6T1h/KD8TR89WfGoPgFcmhg0HvFVj
         YX/3coDCZPrNZtvFLskkuqeDGxKXDuNOfRDFFR9XJa8zLBwzCeffRh8UTuFPJLl/Y1+6
         kp5LMVAbLBVDDyIXpkYab9q0rSWDYcuh15Wp/8jMtvI1fN9nlubumE834gjEDoIxAR68
         3iwTN4UHkCyAZGKRoG8GxHAFFjUehuyXvU3mSdCadF0QVrpSIxpHRx/6JB0vqklMEvED
         5aUD1B2RRVNP02O4N1UkwgTreIoMg7Aw3cDCBmqJtvV7reJtBBoM6SqX+36eMbFegnjW
         rlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770138380; x=1770743180;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2zpSWOKVkTC9vunaw1bGcPyEvFrXlNi5n7QMNDoYpM=;
        b=cIbMB9exLKsduDziZ4aBA0YYgkOb8RGM0VhqPT0B1JMcJ49BIiVHhRGUWzaZEVum5x
         u/25iBvyMlKrfXkF1GljnGFU8veXmf32klCqEM9wd3C+io15JNpIxPVkK5ap7bnBF/yl
         1w8x4Os7zV9PBQiTG+Ec4o94vD6dvdWD/5TF1GqvddyuTQ8iW8XLmf0dVfnISk6MObIc
         izIDbweHC2SOEUNKcD+/NnoW20JVrWKY37jlKbb3FkgdMmkNMdzjudMo7SEuZJqPmr0F
         r2z5fW+gLS8//6UC/5VLWl7BofHAXi8rHNht+ezzwiWDv/bdU7giEAZtZVgeUkUORRku
         c+xA==
X-Gm-Message-State: AOJu0YxJUNkTku21Dox8+AiiD/HRg3xmGlAH7ZvZZEwFJNMcvULMEH6I
	F5ITAh2k3GEnBTn9jFT6VH+Ss7QlzU8lnNIHQB7nA9jCIWiy7eEuSSVdi27rbpF5i0jOtmaCiCe
	/eOSxQOk=
X-Gm-Gg: AZuq6aJWAQG5uhgn582D8DghQdeHvrKork88KkY83NHyYkgC8lKs+k2kLDWogjps0a3
	W4kuObSKiFiy+HAofxhtb68RXShwUQi36vSioXoHERuituO5hdOHtCt+K2RZxnlTuSkKbu/Hc/M
	7WM15U1ORXiQokmwpk7xR8Nrn/5UXbm51Su6CjeLVZg+PWyjpYnOXoakZL9YfgTbyQmS6rBCNx7
	EAy9Ec9pCbMBXcDO1YrYndYZ2coR6NU6gsqV9MGGNbcoQGolcoYEEChbhzA36+PFYKNquU8T1md
	quCa/Il+UndQD1aY8YfEqNRJ3HlEs4oX/Lb4IvgflKbPNxioQUAd9HHtT3JM9AgEnoNeNhlCbwJ
	QFir+9ymimcaFl7gv68Ih5bKviP9gyxQC6Ku1SHDg2H/t5g3JjEwGO1Ox3YmtwI/c9zYhGHy7XS
	rSNDW9c4qmfG4FZ1VdNPXfYrx/4EvL68Lj2ahZYwp7o6pNyZunB+zbyC1a87V+FFBA5EmfviSgG
	UlwAHs=
X-Received: by 2002:a05:6808:f0e:b0:459:bcff:a9ff with SMTP id 5614622812f47-462d5a2e9c8mr35838b6e.34.1770138379757;
        Tue, 03 Feb 2026 09:06:19 -0800 (PST)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45f08f5ff30sm11543610b6e.16.2026.02.03.09.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 09:06:18 -0800 (PST)
Message-ID: <f8f9a810-3e66-4010-b6c8-47cd9d1c9292@kernel.dk>
Date: Tue, 3 Feb 2026 10:06:18 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring/fdinfo: be a bit nicer when looping a lot of
 SQEs/CQEs
Cc: =?UTF-8?B?5piv5Y+C5beu?= <shicenci@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add cond_resched() in those dump loops, just in case a lot of entries
are being dumped. And detect invalid CQ ring head/tail entries, to avoid
iterating more than what is necessary. Generally not an issue, but can be
if things like KASAN or other debugging metrics are enabled.

Reported-by: ??? <shicenci@gmail.com>
Link: https://lore.kernel.org/all/PS1PPF7E1D7501FE5631002D242DD89403FAB9BA@PS1PPF7E1D7501F.apcprd02.prod.outlook.com/
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/fdinfo.c b/io_uring/fdinfo.c
index 4f12e98b22c3..80178b69e05a 100644
--- a/io_uring/fdinfo.c
+++ b/io_uring/fdinfo.c
@@ -67,7 +67,7 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
 	unsigned int cq_head = READ_ONCE(r->cq.head);
 	unsigned int cq_tail = READ_ONCE(r->cq.tail);
 	unsigned int sq_shift = 0;
-	unsigned int sq_entries;
+	unsigned int cq_entries, sq_entries;
 	int sq_pid = -1, sq_cpu = -1;
 	u64 sq_total_time = 0, sq_work_time = 0;
 	unsigned int i;
@@ -146,9 +146,11 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
 			}
 		}
 		seq_printf(m, "\n");
+		cond_resched();
 	}
 	seq_printf(m, "CQEs:\t%u\n", cq_tail - cq_head);
-	while (cq_head < cq_tail) {
+	cq_entries = min(cq_tail - cq_head, ctx->cq_entries);
+	for (i = 0; i < cq_entries; i++) {
 		struct io_uring_cqe *cqe;
 		bool cqe32 = false;
 
@@ -163,8 +165,11 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
 					cqe->big_cqe[0], cqe->big_cqe[1]);
 		seq_printf(m, "\n");
 		cq_head++;
-		if (cqe32)
+		if (cqe32) {
 			cq_head++;
+			i++;
+		}
+		cond_resched();
 	}
 
 	if (ctx->flags & IORING_SETUP_SQPOLL) {

-- 
Jens Axboe

