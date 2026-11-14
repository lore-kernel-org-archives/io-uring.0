Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626195;
	b=BsCLdS5sEtfAl+rgMcV+vv62kH26rMz1TZKhQtsxYhLyMLcfuwUIF0iggSZLjHusrVla
	 +yDc+h4b3QpZmpiFrjrcB0aSJqnrGjRCwrG2DA6NYeFpSnYCxvNXvjYN3h6DsGwj+qRJK
	 nPde9m6HTON5m174S3zHXd9hTAFte6KiWnbeV8YZvEr9wXYoPb6EiFNtdeS01zaNi88rZ
	 3kWHiHuU9gwoQDKX6xZI2PrZ1XN5KZx+X1ao9ZQlg5ycWfia/hyNFbgSugPf/7UMc/PiK
	 iI9iDNzmA97Ul0753pLQq7nfi+vIX/zHgKuO59E6t1msHdcLL/AZUwkUpQeZ0W9g/wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=o/fES0fk1aivqsdPM4/VqMrWEp/jED2qjiEqrIpnUHs=;
	b=YTrXsGpBK2S5YNVNUApTldVme2EAo+NjkxraBJQBhL4bphcyIVAafLQx/Mp6VPmxw11X
	 Ne2whIejpVi4u0w7G8m3K5KcoBIRGQhTLOm/DlKA5MfTEf9mYZH954wEnOtxPbA1fS4u+
	 dQ1zQaf1P1tE8Fw3eNGKdlTaeIFKRc85tQE6cS08w9IBOb21k/Swla+otDpIiNP/7syu8
	 nJqZIvnpEMB/QN7nRSg7304xGvfAgna3oG2ptJiPG0Bojx6yVV85dpfpMwFxIrX7za0P4
	 mA391Jkw193QrbqfMWR9G+FgjYw9OE10hd3lG668xoEfnQS6XhdReJTRGlGgNMzmqLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=HcH7B0Zl;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB8606A337
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 03:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BB8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=HcH7B0Zl
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93cd206e16aso29399585a.0
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 19:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794626189; x=1795230989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/fES0fk1aivqsdPM4/VqMrWEp/jED2qjiEqrIpnUHs=;
        b=HcH7B0Zl6P8avn3M5oj33okh0BR5rgAId0ncO5IgSrW2+A9vwVqONK9ti7KzYgSdUt
         8oSZipOShHoFmEMIN6iZeUZ2LyQyLo2Evct/VkcLuiOKL5Iy62q2WuIxyU5/9fbO4i/O
         U6tbpU2xZc/CRzBs+plCpfwAqoWlEDbHH/CqK9XS6Vr2cnqsRB+VI1kvV86Tab8zVOsS
         Z7m10cWEESmgzw29bIjb3tHMI+nwM2i70UlLQWJx65ZF8qEZcqzBLldrIY1zYRwjagrd
         1c6J5QDxW9hPH1387JeYbr1RH7LPSj9fBHvFjBCPxGQAFEDa3t3WiRSEeYPfk6+LA/LE
         kvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626189; x=1795230989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/fES0fk1aivqsdPM4/VqMrWEp/jED2qjiEqrIpnUHs=;
        b=xrlF+rwiV4pbdB9G45bsFEBOf1kUxx2qIC8Q9shCGen1RiZPwvEyR3T7qUCqaCE0JU
         44t6pIYOUmoGxH0sEpOJzwfVYHUKaQLXT2I/qXCIxam/01lWXfn76rwhY3Y59tM2CKJ7
         Ej7wRRoECWNbKJQKEF4o0W9Km6qfMQYtjMnxMwDgpscGbrbEhgfOZV3NpQavfopYqSur
         7c79saxm2kwRSf2F+hc+95SE3bOXPlvoyjWo9yH7CZp94ILy2OtJVlpGybEyHUZYLn2i
         X8L7d+/vXrH4c04aeipB7t4XwMzRIYiMpDNFThFBuh6GFGDLFEAlefpcscgPGWGX/MY4
         jaOA==
X-Gm-Message-State: APuU4Z+eHOtXW/UK0w5Xqu8d8SX9CWRAsl8GqprjEnNgem8FdbvHf1MM
	J7Art/xpqwx5q/XOt8Sqk9kwzAGJJ0rPlrlXGbflE5g0l+UjG8ElY6Owa5/SOaaT0CKRF3EJAMO
	crOslVHasM1ZTGd0wMLTDNAcY/Hzk9qA82MZcF9uWwaBZfEh3Rx1w
X-Gm-Gg: AYBFou3psm9PGtzHjaUTUR5GKGG90JFHEYo/6ByPM426eQU5bZ56fTg9pvr2UcJnvw7
	K74t+yRTZaQxCTtCVvfahp3p1ZZRLKxH5cZjmMq7hN/6LhF5GrSiaR0z7Yvec/Up+g5JHIbsdLi
	7W/YktCwGxuGGvgFS0IcjU+o4kJ7qzfgUX/zyUHblrG/7vv5ift+2BR3lW79+CpLUScHLJyE1ie
	9MXNlSR/AW2KTOmAYm6mY9eLrH6B5VKq/yOBU7mU5wy9tBevp2HHZxI+hqCECo8aZVHXR3B4gVE
	H8NI8kHEKhBLRiubNriKi8VUmk+PUYoq6n6zIAFJhwx5v6ENbNQs/Ntn57DAGywk+fpPCH2xcuZ
	CCnmpSP/YRCMomyn6
X-Received: by 2002:a05:620a:7301:10b0:92e:6485:f640 with SMTP id af79cd13be357-9494bc3ee0bmr678351985a.4.1794626188511;
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c7b4f07sm85840085a.12.2026.11.13.19.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.17.2.4])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 3FF53401CE;
	Fri, 13 Nov 2026 20:16:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 3CDE8E4049B; Fri, 13 Nov 2026 20:16:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 1/4] io_uring: return io_req_flags_t from io_slot_flags()
Date: Fri, 13 Nov 2026 20:16:18 -0700
Message-ID: <20261114031621.2924144-2-csander@purestorage.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114031621.2924144-1-csander@purestorage.com>
References: <20261114031621.2924144-1-csander@purestorage.com>
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

The flag bits (29 and 30) returned from io_slot_flags() happen to fit in
a 32-bit unsigned int, but not all flag bits would. io_req_flags_t (an
alias for u64) is the canonical flags type. It's already returned by
io_file_get_flags(), so return it from io_slot_flags() for consistency.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/filetable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/filetable.h b/io_uring/filetable.h
index c348233a3411..998026617963 100644
--- a/io_uring/filetable.h
+++ b/io_uring/filetable.h
@@ -35,11 +35,11 @@ static inline void io_file_bitmap_set(struct io_file_table *table, int bit)
 
 #define FFS_NOWAIT		0x1UL
 #define FFS_ISREG		0x2UL
 #define FFS_MASK		~(FFS_NOWAIT|FFS_ISREG)
 
-static inline unsigned int io_slot_flags(struct io_rsrc_node *node)
+static inline io_req_flags_t io_slot_flags(struct io_rsrc_node *node)
 {
 
 	return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
 }
 

base-commit: ddcc50dd41d331dc66e0e5793492c3fa09941ff9
-- 
2.56.1

