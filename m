Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790382;
	b=uBtm+0CSry/vGO9wi4eaAHwT3GIlI90LixeuWql5rk5pN6vDNCVUqzoxA4z5CYl2OzH4
	 GKJqKtNX9SW9azYKHgWpY6vqZbqg1OTkfjvNNlfoqADyCPKW0aVFBYeCrwomZ9EgqLwrB
	 O6vn8Mh536Pl9JVutPw80OL9TeAXpQW9m+sa1WwDxsqQ0JdGNMuaH9GFhxF38am1FWbzK
	 7hb2vC2jlhIby75b2Us/hfY24zAlJEP3cxV47lfEephtwQXt0wqdOFKMVbbmYRmTyBPY9
	 SipwwGwsZC23oQZz+m1+UF4bCKzMg8ZtaT9WFQRO2BMYU9VLzaX8XD+WtUinJPLsqJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ejFOU++T/9CCYj2HdH5u0LvKpWcRY11f5gk3oaVJvtY=;
	b=P6inVmpCnn8mZzWm6bGGXio23Rk2vDQHPVolkdFJSgGJMX/PBbiDnrMrZOKxzeJxXcIB
	 LHS2/prkZ4MOt3BSMxljleJ+PhY+D+X3pkNY0gdvVI47EIS7zkhfixF6r/qglmowisDqg
	 LUfooRkKaYTPuh7gAsrmNKUF4/poUxnk2DQG8L54rfNPlkwr0rWtuU+vdJSh6VW0Fp+yv
	 /JXZtxbQXmGnZQsdCdHG6JR5V5mZi36n/6xaee9cBPEoKvyI2lg2NPFcGQnLGFzJu9MhU
	 gRIZBVK/Xor/vLNi4e2XkiyhkXbnHRe6tJ4u9ImHKhNsEaQ0C7LZydPOIsPjYsJuV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVcG1XGx;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4D0606A329
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 11:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A4D0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVcG1XGx
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so476769f8f.1
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 03:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790381; x=1794395181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejFOU++T/9CCYj2HdH5u0LvKpWcRY11f5gk3oaVJvtY=;
        b=FVcG1XGx2s+Hq6Xbx8OcBYgg40281bOLlyYaGn5g3/vhaALb2G3kbutwCtWtbvjxFe
         /PbfDtyTt4QhcW0vXqXdlZARJVL6PuwWH1GSOl0oQt+7mnvUA92HL7rzK11P0rVXy4uQ
         pSZ7I0QdFrLh67EBejhPG3MflzHLVBm86jx/hfcoTgmvyz4QTNNoA/NWn4hryKp7mZj/
         iR8EvGSPebjeW4oa4ZDfnLtKaLeoe0BBHGSl6Znf9Z8d1JTQXUQBTrhRZ6xljaO6eMqR
         xiPloGb1cv+I77BBfExpS9Bq2eYbt5KwUUZHRouM3NCx7/YvCx8tmBt5xEPF0uw2fcmZ
         fwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790381; x=1794395181;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejFOU++T/9CCYj2HdH5u0LvKpWcRY11f5gk3oaVJvtY=;
        b=BH6YLzMLaHEcF/Zl5+dgsTNffPNlMLRhBbiyPSZmenaYCWJeqnFRleD4CdeB53bBm5
         YV5HOfR5PEpJ0ym106F92nWdSA1cZZHZKgDNlJfxlPUg9DI3rIo/ED/Bd+njc9WR0uOj
         Pr9qBJPVgry+1Wym47oAWjeWdSXBhrXUyNwzUrvXK1e7OAj1DJpwfKvLyV09079HATHz
         hawBtjUGYCyxBnTqqL/kN8emCyEr+0PHrBhIKvzS3wM+1IaRH38g0terJP9DOyrAH8wQ
         Up6yGJ6AvMDLCRMF+dch3mHv+HNP/BBIzvMVe7C15Y7Psgb57nhtREJprQHSf93RZDsD
         LDRQ==
X-Gm-Message-State: APuU4Z87pmk8pB6dpwYSDNuZg2RQWRjvzBE99OVb6xPxAxake7Aj9QZh
	hvvLidx+6Jt+1vqB6ZrKVf9mT5Fpv5D3j2w//3PMZx6n2kWdOuoIfvmQ
X-Gm-Gg: AYBFou17y7j7zZDBsn+lpEmHnHIt9vcrouFiaBLX8lAsiPuxsv5kAt8lzuA7jTu1kok
	NjzlJT/8F4dqPFdLY2pK/PusiiXlzrWh500nveGpDMHx+LXA3aFBm9M+junS9NwqnfUA5h+lf+X
	hrc6Rf9WGwNjFTtrF4AsrQWCUIu08FoSpDIa6Lt0aF50N/lH6HqwixRjkfME9ojGf4Nm0k2VIy3
	LHU4F4jyhPeAL2zRIYhvPPpoUyM2SGyFEQVm58cfTUCkDK8bhyzdT/7HOrEp7r9Rmn78o9vUahg
	/Ty9LltkL66hjlIO9JVBbJH1tNnD0phDb/DACfPYBjUL2qAq2bss/vILCLvdPveLgo7T+tWsjT2
	1VjCoFRmR0YR+W6j2TnmNVkvIdDij9xbSKZ77SmE6hfW68rqSE94RNUN4aw0/oqDzeYLnj7XpYC
	e3dQzjUjrVissXZU1LhRd2rirMTSqghySx10EVgE8ailw8JJSXgPq19HwBXtNgY8rxwcyKZRcrZ
	MMpuC2l1iFHJH1uJun77nE/K1hi+kVFIhGpwiqo7ugkHMejB/fmt+jZuJtUnZIo+eGv5jwn0Rpr
	R3AdL+sh8buCdtFA2Y8gI8qhPKJ1LcXNEbieo3Ul1UnrE2w8LgvxA7EUTQRD1mU2AqEwqoxCXxE
	XHX7mck66Q9znd2zqMQNB3TAV
X-Received: by 2002:a05:6000:2310:b0:490:a3e7:8af3 with SMTP id ffacd0b85a97d-490a3e78cd2mr650035f8f.35.1793790380848;
        Wed, 04 Nov 2026 03:06:20 -0800 (PST)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm3704835f8f.45.2026.11.04.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:06:20 -0800 (PST)
From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven29@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
Subject: [RFC PATCH v2 1/3] fs: add filename_utimensat()
Date: Wed,  4 Nov 2026 12:06:02 +0100
Message-ID: <20261104110604.126717-2-meven29@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104110604.126717-1-meven29@gmail.com>
References: <20261104110604.126717-1-meven29@gmail.com>
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

From: Méven Car <meven@kde.org>

Copy utilities that preserve timestamps, like cp -p or a file manager,
set the times of every copy after its last write. To do that through
io_uring, the request needs the utimensat() lookup on a name that was
imported at submission time.

io_uring takes the path of a request when it is submitted and looks it
up later, from a worker thread. The path ops it already has call the
filename_*() helpers of fs/namei.c with a struct filename. utimensat(2)
had no such helper: do_utimes_path() took the user pointer and imported
the name itself.

Split the lookup and the vfs_utimes() call out of do_utimes_path() into
filename_utimensat(), declared in fs/internal.h next to the other
filename_*() helpers. do_utimes_path() now only imports the name.

Signed-off-by: Méven Car <meven@kde.org>
---
 fs/internal.h |  2 ++
 fs/utimes.c   | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index c658c8a5ebd5..985b2bc5895e 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -63,6 +63,8 @@ int filename_mknodat(int dfd, struct filename *name, umode_t mode, unsigned int
 int filename_symlinkat(struct filename *from, int newdfd, struct filename *to);
 int filename_linkat(int olddfd, struct filename *old, int newdfd,
 			struct filename *new, int flags);
+int filename_utimensat(int dfd, struct filename *name,
+		       struct timespec64 *times, int flags);
 int vfs_tmpfile(struct mnt_idmap *idmap,
 		const struct path *parentpath,
 		struct file *file, umode_t mode);
diff --git a/fs/utimes.c b/fs/utimes.c
index e22664e4115f..8072f05ac8dc 100644
--- a/fs/utimes.c
+++ b/fs/utimes.c
@@ -79,8 +79,8 @@ int vfs_utimes(const struct path *path, struct timespec64 *times)
 }
 EXPORT_SYMBOL_GPL(vfs_utimes);
 
-static int do_utimes_path(int dfd, const char __user *filename,
-		struct timespec64 *times, int flags)
+int filename_utimensat(int dfd, struct filename *name,
+		       struct timespec64 *times, int flags)
 {
 	struct path path;
 	int lookup_flags = 0, error;
@@ -91,7 +91,6 @@ static int do_utimes_path(int dfd, const char __user *filename,
 	if (!(flags & AT_SYMLINK_NOFOLLOW))
 		lookup_flags |= LOOKUP_FOLLOW;
 
-	CLASS(filename_uflags, name)(filename, flags);
 retry:
 	error = filename_lookup(dfd, name, lookup_flags, &path, NULL);
 	if (error)
@@ -105,6 +104,13 @@ static int do_utimes_path(int dfd, const char __user *filename,
 	return error;
 }
 
+static int do_utimes_path(int dfd, const char __user *filename,
+		struct timespec64 *times, int flags)
+{
+	CLASS(filename_uflags, name)(filename, flags);
+	return filename_utimensat(dfd, name, times, flags);
+}
+
 static int do_utimes_fd(int fd, struct timespec64 *times, int flags)
 {
 	if (flags)
-- 
2.56.0

