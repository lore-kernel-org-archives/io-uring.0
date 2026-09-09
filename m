Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA6F48EC89
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 22:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992963; cv=none; b=WQK0TihgDgV6ErAg1/j35dJkn8uq8l2ZRP8494FdP9IKIZ93IekgPR+AAQJxtWxMddadHKiuovUVQ8fotSbMWUsBQhiZxCh6DwXoHwmLDy9D4/ky2r4nEAOkZSBSPq6hvqrjUdUm25L2Cv1sqbKjOrDqvCUMEid2Bl4a2Lyy9ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992963; c=relaxed/simple;
	bh=WlsOlqUvKm0Axyc+Vr7Lx6IQyXMjzH3K2ebSlJNCLAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TE3pHDuxvV/cel6+IzgdtYV7h0MsTrwdYyC8MRzXkIQfBS0mLVIZONa9sZ8Fdq0M1sbE9uMG51SareSJWV+u5D95Vd+KDHR3LmOaNq0j/pePjmuJ3odGUWKERIeFHE0xSaGcBbA2KTcCvves27LmAa6O8N9M8Yqla8DNfH0XY0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YlaDTKAO; arc=none smtp.client-ip=209.85.160.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YlaDTKAO"
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-52d712fb5ebso1989481cf.3
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 15:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788992944; x=1789597744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMfVAOprw3d03YbEriUlDSnVZxTmhvnPgihN27iwNZ0=;
        b=YlaDTKAOPD8G9f6lPOdiST5HYvAvKoSvlH1Q0SKuFaO04MjE6GXwrFoaECtfMuWseT
         i6JIP9OpSkWmJrK+hCs5zwirb9PTaYOFEIjPhwYDxXlx0M3W4slMSObihwDMwEK+8Sly
         JKNS3jSK+MBICrCm6z/UfNqdlcUPH6zO3SXSeob9nWcjF0qeSNpwwm4wk5vSfzAjMpae
         tI94U6R6t6K8/p5ch9nWGNj4sr5i2Bpp44VbJYIGDBxW/SUzU0dK+fb3ptJmA18VTkta
         1aQWLCsngoLenxXlVpKPtsi8mzs2edAo/XdAkknk6Nnwomtk7366JjmabSnqOYnZa5ch
         K6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992944; x=1789597744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMfVAOprw3d03YbEriUlDSnVZxTmhvnPgihN27iwNZ0=;
        b=DT7JLqeW26R3jzPRwRoDp/NIBd1PMdAX0b3bmfbrvStg7CxXvHjFIcynX4HWYdHcEf
         zQLlZs1dcxZPFcdQUrW1AmSZiQICcwdkS+z0Km10a8tsnSBiHhLFtXZmZOgINUeioN3m
         uJa3XThbToWpX0T/FbnUzJ8e/zSd34yU699zqF6RcbcIdodX/131XvMsdWF+UvDNCrt7
         KVZ9Pi5HRFRDc3cyiY18QA6dI6ur6HYL9ukc/tlIIboW310TDotP4hmNYYaBeU3faQdT
         4D3piWalqp3/KFk9IdYyRdX1V3fd7rQ/JWmjhriEmDjo4/Wplh26axtadaCfcNYAOj0b
         neJA==
X-Gm-Message-State: AFuF++nc3q8I49jJMRxqrF3oEZhJgEAN/8U0LBMm0R329R3hG/2NGffc
	YRoauD7t65UglyFSVlYU+8uV/LPv6yF1WQev2/yBraD9ECeRQRChUhyT4NyKkOc3VfI9h84300x
	EkfLooN1agpxWUoLdcBDscaRWCl7Ypp35dEmDVzTIPPjaKwEcN++V
X-Gm-Gg: AYBFou3vriknxst1d34r6Rob7moB4kCsIfNwxLxEMKYDDZtOzk1Y8iukWA8zuWOSdxT
	1akCAswLjGx4Gv1PJORoAxhSzNL2HAzPChp1adokM0KkopzAmPkjNzAabfW746Mh/Sho8ee4Olt
	kjLAkfmy+vR6WzXP+ZQkTfgNV5Df0EcI3YloZcGF1Zf7u/nvVHVlifiZUd9PL+btBNMLgZ1ehcv
	NMgfIZHgF878uWuuU6ISN2/K8DxfKvdmaaapuuOLcrmNvDVDUt5b2mQlLJut7IeP2OpErh6/U6c
	Mw2ZZc54TABI1uvmM1oUyN8AVpKuKYyGaf3R2xGDKjF1nPWdIDRkWep6AT3z2869UZAYBrlaDCO
	jwRlkPr3EUqr48SlX
X-Received: by 2002:a05:620a:46a0:b0:939:8a2e:68bc with SMTP id af79cd13be357-939916a0e37mr2963766485a.1.1788992943812;
        Wed, 09 Sep 2026 15:29:03 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91040757b20sm1488646d6.24.2026.09.09.15.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:29:03 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 096AD402B2;
	Wed,  9 Sep 2026 16:29:03 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 07299E40322; Wed,  9 Sep 2026 16:29:03 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 1/6] bio-integrity: remove dead bio_integrity_copy_user() error path
Date: Wed,  9 Sep 2026 16:28:31 -0600
Message-ID: <20260909222836.2475352-2-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909222836.2475352-1-csander@purestorage.com>
References: <20260909222836.2475352-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If bio_integrity_add_page() in bio_integrity_copy_user() fails in the
write case, bio_integrity_copy_user() will return an error after having
already unpinned the user pages. The release_pages label in
bio_integrity_map_user() would then unpin the pages a second time.
Thankfully, bio_integrity_add_page() can't fail here because the
bio_integrity_payload is freshly allocated, so bip_vcnt is 0. Replace
the unreachable error path with a WARN_ON_ONCE().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 block/bio-integrity.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index b23e2434d80c..8ba8bfa41f8a 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -299,19 +299,13 @@ static int bio_integrity_copy_user(struct bio *bio, struct bio_vec *bvec,
 	else
 		memcpy(&bip->bip_vec[1], bvec, nr_vecs * sizeof(*bvec));
 
 	ret = bio_integrity_add_page(bio, virt_to_page(buf), len,
 				     offset_in_page(buf));
-	if (ret != len) {
-		ret = -ENOMEM;
-		goto free_bip;
-	}
-
+	WARN_ON_ONCE(ret != len);
 	bip->bip_flags |= BIP_COPY_USER;
 	return 0;
-free_bip:
-	bio_integrity_free(bio);
 free_buf:
 	kfree(buf);
 	return ret;
 }
 
-- 
2.55.0

