Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6A43C871A
	for <io-uring@vger.kernel.org>; Thu, 12 Mar 2026 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327945; cv=none; b=utDk5ThBmB+4IK3n9/V9N+QWOk3Nw0LJYK5VWMUf+YTCNyY0f+nMVIJdqaN3Gtgn8wl+RTpvbiwRMccsl+kmHEbUJNPhYoMgAaT6eKs5youZ7PVUT7CxpMC5m4qJrYdpoXOLATVexWCkOhLTRt2IGg+et8tn/tOr2Ozikl+ie4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327945; c=relaxed/simple;
	bh=eh50Hy8M+m9+5Jqswyj21q+5Jzog77dKdB0pPNWXKPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3e0wl/s0Bbj3AoA+VLfbKWbEkc5dv5Nsakp0nk+j3TMmUY4IpkxrjYsYXOb4nR9TRamhret2i6v+ljJNsh+pPeNqy/OrTJ6htGrgFnv81PVYz1BwYkWsZXPLUwHuG6DKpl/5nhI2jdRsq8msBKgIRbZ98HiR2hPjLGd9DgfXB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org; spf=pass smtp.mailfrom=bitbyteword.org; dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b=U+XxDu3c; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b="U+XxDu3c"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d4c383f2fcso932480a34.0
        for <io-uring@vger.kernel.org>; Thu, 12 Mar 2026 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1773327942; x=1773932742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlI+FZk7B/0fQd8imwIG2KMJsSApC3YjCod1ZriPdzE=;
        b=U+XxDu3cvyGfrRxFJUdjYMWyhbuFzENXF75qbCYug0NSEp4aMj949kW1vt2NoFmFY4
         SKrq55BXv+IPS/xj9MQwMB01efUh1kWxT3ZyIw19NkFq8A+TgBbrWybEPTA/Kc0/+U6Q
         GLMfDy91CgDmuKgThkoC+bsdLCnIq7uaUiAcMQnEXfxWY7hobEWN7TNcaiTXsNRL92sX
         OXbwnOet549YoY/fkG9dLKl5CAzhJkz9CDuTcsDbbfYNGMdhUm7jcT6XelQionM/A0CD
         GUbKMfRpMbpdATFZVPwm5QfLo2KP89jeVsqW+gVJA6Iyi6T7rLYJWj1e1v4qIhxU5DOi
         m+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773327942; x=1773932742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KlI+FZk7B/0fQd8imwIG2KMJsSApC3YjCod1ZriPdzE=;
        b=O9ekMwWyA7vrsrC4kz/M+aDUa3apTSknF+oZATvt39sB55gKLxOfAziaC/xVlEKnzq
         MedCZptr5IYXhcTmeIFu0YTRYgUJYtiI6C3eg8bnC4DWocXQ/eKCkr80dca+7biMuk7f
         1Zfn7Jc8Rt2eb6tQFXo0jaRRjO6cVz/AhsFuQyQkWOtTOFe8lv6udV1P+b/yd22sJYRs
         lHzsyTBYFh24u81cu/9xalY+Q/I1iD4SVa0RM1huOUILarHfI3Obz9rj5+sgUT+QMtBU
         emovehAfbUXLIVQDOPIdjV3A6tAzeZrrZjnMz2l/WzPrYGCJfqw7HpiYH9BRqV77Tybj
         Ar3w==
X-Forwarded-Encrypted: i=1; AJvYcCXTmcP2FGxRXn3zsA6Crmt3uAdbeK0gTMNd4U8BOQv6L50qFNtPI7lAMQXdDWZfZ+PGH7nZ5nk83Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/d8jGww7Uz0L7ssw7JugwhIwk4Ekhwq4fMpWISND04E9ShNW
	iAz+4xUr+3mQ2/FxiP6NFJV5HX5axT+9EfYV8t+e4u4vURE2GBCzPSUsgRurkMDM4IM=
X-Gm-Gg: ATEYQzyV8T8dvaFHc/zdUOLezQWE7T5I2PHFkDLSStHYrHy5p8+AuFENFudViW05XLa
	3L/ozvjDvpTsPXLc6f+agRdzyvDrHOkN3j1BSy8nmF8ytQkCzwEcDZdcdw4DLFQ/SN5GyQiJpYm
	QQlbgC8y42dwKtEKo9ACjeDAngcvmeGp29TdZQHg3XGaCAwPADkOcdqwuBcvdMcO3vuID49GV25
	DFknMzSg5QoxXvAF5FDzQ0i07EJCgwSqYavvfyhZBr387doJ56epmQ7uPTB5SvDfJbJDGJTicxp
	MDOexswg/Q+JcKJRBw8q8u97A9eh4Wxg+7IUVJGK4/M+DNmwW0Oa9BjEGWdWz0oYzNqEMUKCd9J
	RS0mnJ9z1JDGX1bC26fiIsMNopY7f8EMAe4Izh5xgiSG7boaZHB2N1LlTKsxzJNNl+mX84yHUg6
	p+pVH7bQnv9GKMXkDAbtvDRtRnpYy5scHfxIqalcEwos+ZfgsH1jq/X1MGwtAvyoh9bw==
X-Received: by 2002:a05:6830:4392:b0:7d7:619c:a655 with SMTP id 46e09a7af769-7d76a84419bmr4749580a34.22.1773327942528;
        Thu, 12 Mar 2026 08:05:42 -0700 (PDT)
Received: from vinmini.lan (c-73-143-21-186.hsd1.vt.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76aedae57sm4321776a34.28.2026.03.12.08.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:05:42 -0700 (PDT)
From: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>
To: 
Cc: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH 03/15] io_uring: Use trace_invoke_##name() at guarded tracepoint call sites
Date: Thu, 12 Mar 2026 11:04:58 -0400
Message-ID: <20260312150523.2054552-4-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312150523.2054552-1-vineeth@bitbyteword.org>
References: <20260312150523.2054552-1-vineeth@bitbyteword.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace trace_foo() with the new trace_invoke_foo() at sites already
guarded by trace_foo_enabled(), avoiding a redundant
static_branch_unlikely() re-evaluation inside the tracepoint.
trace_invoke_foo() calls the tracepoint callbacks directly without
utilizing the static branch again.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
Assisted-by: Claude:claude-sonnet-4-6
---
 io_uring/io_uring.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 0fa844faf2871..68b7656e1547a 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -299,7 +299,7 @@ static __always_inline bool io_fill_cqe_req(struct io_ring_ctx *ctx,
 	}
 
 	if (trace_io_uring_complete_enabled())
-		trace_io_uring_complete(req->ctx, req, cqe);
+		trace_invoke_io_uring_complete(req->ctx, req, cqe);
 	return true;
 }
 
-- 
2.53.0

