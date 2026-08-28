Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A89284693
	for <io-uring@vger.kernel.org>; Fri, 28 Aug 2026 18:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943501; cv=none; b=AyNksfJX4W1flqnUcJGYJfIW5wcN/cOLugoh11XUOaw/8n2in8tIpsYCML2d/vbq8TZhW8UllabW+EU7CXrm8Z3KVilcrnbPDAyJDf7coA8ngY9zgRPJveEPfq8nx7Cq5mGYA2+OeYyGVpb07ts3qxEb+hqHsyTMeHoaWKboKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943501; c=relaxed/simple;
	bh=Ba0SJ5o/8kpr/XOQTU3zZSW3vPeQM50tchGGH3tXePU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MqGMh4EVmrMBx6FReWeTmcv3lRG95lPqZc1v75LHzytoRxTDxZslystW5yb2lJtb/wPxv5IJdRDSYwqAQ6SqOHjIvh+UT4IKpRkczGVJ1SxBGRzkBUfIonhaWKt6n9FmT36Mkc4uETwTtpVyV7QPxjrK2gEFbulcTcfuPBUBhBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9kaLJ/7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9kaLJ/7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso1234211a12.0
        for <io-uring@vger.kernel.org>; Fri, 28 Aug 2026 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787943500; x=1788548300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ba0SJ5o/8kpr/XOQTU3zZSW3vPeQM50tchGGH3tXePU=;
        b=A9kaLJ/7RJCJUzV8io5K9LCazQAAftyMaQqplBvaB52LL5rpZ2wSWonvUq4FekiRDw
         lQanrluCRuSRdl0ph0v5bAZ2NFCpwYD6beHTK3gG7DucuM7WwIW90mtOBNaEuxgcZ/o+
         aR6Liym2FfecbuMgBM5A7jDVvyIjBWuF/W2EHgcG5IWPCmZtnWmv3ZYIH+N/+v9tbCCM
         dgtQbzCg0/n7F3plOGdYk8y9VW79/XkjC3sOj0JRQkhQ8YxNDGJdTPtDSSxpVyeOZ/Tb
         1Fg9ca9kq5Xt/aqnMCypM1UPdCnizo8/dXru5Bx6IwShPax9sAc1oJyVEKb3oVZvI1am
         Xzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787943500; x=1788548300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ba0SJ5o/8kpr/XOQTU3zZSW3vPeQM50tchGGH3tXePU=;
        b=jgRWFLGybiImQ81G2XJKnjfwbtgn4tLSBL4TUnPYS8BdonVYBWvSBu7vF0eXiAwmoq
         JtXqFE4+6vEr26VxceN9RTrMgpd5djH43qsQDcgsOBEyKUXs5plSVS9sd/Z1IODH4GPn
         J2tHILh9xwlVm1SQ9BpfXZqXwGUPXpcm2WPz9cVebXl40gjpPBTz/5pBHe/zFcLx0Xrq
         frzTt6inNaBVTeoPrf18LAmXI6Gez+yHqLGqJ4ITTYJE0ly5IfPXWaMIM4YV+Pd3+/8z
         9Y0oM2y6ATImkqcyZcQYq1QzlsOV1y2IUHj7hqTiCcD9eDgbEyPrv2LJQ5Kah0D3A4El
         IJ4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkC03Lv395NN9C+nKz3yYZFxS9HTbL62p0QqO5X3CbGERBp8j0BrW41V1R/ehhRsumPqnjSMCC8g==@vger.kernel.org
X-Gm-Message-State: AFuF++n/6UOnbaCj8Z/ePHKtOcj+uOd42JnGE4EnIMqg1Lr8KgRMO3M/
	xCbunlN6nDlKqWi8bWOGhWRrG/cr1LAn3sBW+zYFRdke5vLscoE+RAGSUxXi7kvKl9E=
X-Gm-Gg: AR+sD13X1XH+mUxzccqnGSoDoqzWYuwfeggumq5VvqvAbr694EYO5HcmqQer9IXwlQM
	psplXG8E2RcJRCek96W7MNoZr5OzMKaAr9ktGr30aBaDPMccJEe1xjAhPL9/fQz7rlDJRY1ZxYu
	ZNOH8D83e4saxE6Umb1e16zE8hdlPHXl7miBU37OWXdWQj+gT4MyQkE3zdiuBAROrUiFeFsoQyl
	By5AXLxRxfp/v6VoIYb9k+/UBt8BNCndjLOMtTsvP2sKcbSu96+RdYiabGBunUH0cIMZLsCx9ju
	Zalv3Mplqw450JyZ6xN3bq83G7JU36XRAsC1y2L9HCdD7VB/qQds3i2LT8QvJ17o1oP9xtbnuF2
	NPtWtt5WDEg6p+eOxWvLkIAMjXVHeVR2TatSZ/CEUVnfZE4S7XBwco+NN1RmV7g3CsEbgmHkJ00
	i8NtTrFL7dUVfi58hziNqtOv3VHXeFSn3r2nRIuL82bGhN4d/XAPqwo/s/d8PeRwgvLl+Qfkdiq
	bhytUaPMmwrThQ1aWNLqqJRhFr6J0B/j0tr8ofcEoENDOxQVQRi0iB9JIGAzFiHNkUcpPTUcLSA
	FtNjtYboSAnEcr3DDSYapHInLJ99
X-Received: by 2002:a05:6a21:9995:b0:3d1:66cb:d49 with SMTP id adf61e73a8af0-3d266681dfamr14619275637.4.1787943499568;
        Fri, 28 Aug 2026 11:58:19 -0700 (PDT)
Received: from fedora ([2401:4900:8f63:c6e3:e917:5b1e:932:cf63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm7839103eec.22.2026.08.28.11.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:58:19 -0700 (PDT)
From: Prateek <kprateek283@gmail.com>
To: axboe@kernel.dk
Cc: krisman@suse.de,
	io-uring@vger.kernel.org
Subject: Re: [PATCH v2] setup: dynamically detect default huge page size
Date: Sat, 29 Aug 2026 00:28:09 +0530
Message-ID: <20260828185809.62998-1-kprateek283@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87v7aqhi0h.fsf@mailhost.krisman.be>
References: <87v7aqhi0h.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jens,

Just a gentle ping on this v2 patch. Gabriel gave it his Reviewed-by a while back, so I wanted to see if it looks good to you to pull in.

Thanks,
Prateek
